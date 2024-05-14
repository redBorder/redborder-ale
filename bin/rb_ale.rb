#!/usr/bin/env ruby
# frozen_string_literal: true

# @Description: This scripts collects data from a ZMQ of a ALE
# Decode the message collected using the protobuff ale schema
# And output a message of type MSE in rb_loc topic
#
# @Requeriments:
#   - gem install poseidon ffi-rzmq protobuf
#   - The schema.pb.rb needs to match with the schema used for encoding
#     the message before sending (Ale schema.proto)
#
# @Version: 1.0

begin
  require 'poseidon'
  require 'rubygems'
  require 'ffi-rzmq'
  require 'protobuf'
  require 'yaml'
  require 'time'
  # require 'bigdecimal'
  require 'net/https'
  require 'uri'
rescue LoadError
  p 'ERROR loading dependencies'
  p 'Remember we need the \'schema.pb.rb\' file in the config directory'
  p 'Exiting service...'
  exit
end

# OS Config
begin
  if Dir.exist?('/opt/rb/etc/rb-ale/')
    path = '/opt/rb/etc/rb-ale/'
  elsif Dir.exist?('/etc/redborder-ale/') # We are already checking this dir exist
    path = '/etc/redborder-ale/'
  else
    raise StandardError
  end
rescue StandardError
  p 'ale directory cannot be found'
  p 'It must be in:'
  p '  /opt/rb/etc/rb-ale/ (Centos 6)'
  p '           or'
  p '  /etc/redborder-ale/ (Centos 7)'
  p 'Exiting...'
  exit
end

load "#{path}schema.pb.rb"
p 'starting rb-ale service'
p 'load schema.pb.rb file'

if File.file?("#{path}config.yml") # We are already checking this in serverspec
  p 'Loading sensors from the config file...'
  config = YAML.load_file("#{path}config.yml")
else
  p 'missing config file. Exiting service...'
  exit
end

# Setting up the kafka, we are gonna need to change localhost to
# the correct domain
@producer = Poseidon::Producer.new(['kafka.redborder.cluster:9092'], 'ale_producer')

# TODO def suscriber
# Setting up the ZMQ reciever (subscriber)
context = ZMQ::Context.new

# First, connect our subscriber socket
subscriber = context.socket(ZMQ::SUB)

config.each do |ale|
  p "subscribe to ale : #{ale['ale_sensor']['ale_ip']} on port #{ale['ale_sensor']['ale_port']}"
  subscriber.connect("tcp://#{ale['ale_sensor']['ale_ip']}:#{ale['ale_sensor']['ale_port']}")
end

p 'subscribe to the location topic'
subscriber.setsockopt(ZMQ::SUBSCRIBE, 'location')

CONF_PATH = "#{path}rb_ale_aps.conf"
if File.file?(CONF_PATH) && !File.zero?(CONF_PATH)
  p 'reading the aps/radio config file'
  file = File.read(CONF_PATH)
  ap_radios = JSON.parse(file)
else
  p 'no aps/radio config file'
  ap_radios = {}
end

# 0MQ is so fast, we need to wait a while…
sleep(1)

# Method to produce to a kafka topic
def produce_to_kafka(msg, topic = 'rb_loc')
  messages = []
  begin
    messages << Poseidon::MessageToSend.new(topic, msg)
    @producer.send_messages(messages)
  rescue StandardError
    p "Error producing messages to kafka #{topic}..."
  end
end

def calc_geo_position(x, y,_ap_floor_location)
  # set variables
  x /= 100
  y /= 100
  geo_pos = []

  #floor_img_width = 18808
  #floor_img_length = 1184

  # TODO NOW check the google map
  #floor_origin_longitude = 43.267019
  #floor_origin_lattitude = -2.9454061

  floor_origin_longitude = floor_origin_lattitude = 0.0

  p "_ap_floor_location = #{_ap_floor_location.to_s}"

  if (_ap_floor_location.split(";").count >= 2)
    floor_origin_longitude = _ap_floor_location.split(";").first.to_d
    floor_origin_lattitude = _ap_floor_location.split(";").last.to_d
  end

  p "floor_origin_longitude = #{floor_origin_longitude.to_s}"
  p "floor_origin_lattitude = #{floor_origin_lattitude.to_s}"


  #r_earth = 6378137
  earth = 6378.137 #radius of the earth in kilometer
  m = (1 / ((2 * Math::PI / 360) * earth)) / 1000 #1 meter in degree

  lattitude = floor_origin_lattitude + (x * m)
  longitude = floor_origin_longitude + (y * m) / Math::cos(floor_origin_lattitude * (Math::PI / 180))
  #lattitude = floor_origin_lattitude + (y / r_earth) * (180/Math::PI)
  #longitude = floor_origin_longitude + (x / r_earth) * (180/Math::PI) / Math::cos(floor_origin_lattitude * Math::PI/180)
  lattitude = lattitude.round(6)
  longitude = longitude.round(6)
  # return the values
  geo_pos.push(longitude)
  geo_pos.push(lattitude)
  return geo_pos;
end

def nb_event_to_MSE_looks_like_json(message,_ap_mac_address,_ap_hierarchy,_ap_floor_location)

  # ** Set the fields to send in the JSON **

  # TODO: Its possible that the sensor_name is optional for samza, check.
  sensor_name = "WLC"

  # Parse a mac address in bytes to a mac adddress in string with ":" every 2 characters
  macAddress = message.location.sta_eth_mac.addr ? message.location.sta_eth_mac.addr.unpack('H*').join.scan(/.{2}/).join(":") : ""

  # we only support 'estimated' mode, so we suppose location_x and location_y is available
  location_x = message.location.sta_location_x
  location_y = message.location.sta_location_y
  geo_position = calc_geo_position(location_x,location_y,_ap_floor_location)
  #lattitude = geo_position.last
  #longitude = geo_position.first
  lattitude = geo_position.first
  longitude = geo_position.last

  # TODO: Check if we need to put "PROBING" also in the dot11Status
  dot11Status = message.location.associated ? "ASSOCIATED" : "PROBING"
  the_time = Time.now.utc.round(4).iso8601(3).to_s

  # Build the minimum JSON that Samza-bi enrichment task needs to process
  # a rb_loc message of type MSEv8/9
  to_produce = '{
    "StreamingNotification": {
      "subscriptionName": "%{sensor_name}",
      "location": {
        "macAddress": "%{macAddress}",
        "mapInfo": {
          "map_hierarchyString": "%{ap_hierarchy}"
        },
        "geoCoordinate": {
          "lattitude": %{lattitude},
          "longitude": %{longitude}
        },
        "ap_mac_address": "%{ap_mac_address}",
        "dot11Status": "%{dot11Status}"
      },
      "timestamp": "%{the_time}"
    }
  }' % {sensor_name: sensor_name, macAddress: macAddress,
        ap_hierarchy: _ap_hierarchy, lattitude: lattitude,
        longitude: longitude, ap_mac_address: _ap_mac_address.downcase,
        dot11Status: dot11Status, the_time: the_time}

  # Parse the String of a json to JSON object the minimize
  # and corrects the > transcription problem with this symbol
  # of the map_hierarchyString field
  JSON.parse(to_produce).to_json.to_s.gsub! '\u003e','>'
end

def get_sample_rb_status(ap_mac_address)
  timestamp = Time.now.to_i
  to_produce = '
    {
      "wireless_station": "%{ap_mac_address}",
      "type": "snmp_apMonitor",
      "client_count": 0,
      "timestamp": %{timestamp},
      "status": "on"
    }
  ' % {
    ap_mac_address: ap_mac_address,
    timestamp: timestamp
  }
  JSON.parse(to_produce).to_json.to_s
end

def get_sample_rb_flow(message, ap_mac_address)
  timestamp = Time.new.to_i
  clientMacAddress = message.location.sta_eth_mac.addr ? message.location.sta_eth_mac.addr.unpack('H*').join.scan(/.{2}/).join(":") : ""

  to_produce = '
{
  "port_dst": 443,
  "sensor_ip": "10.0.206.8",
  "pkts": 1,
  "index_partitions": 5,
  "iface_in": 1,
  "input_vrf": 0,
  "output_vrf": 0,
  "ip_src": "5.6.7.8",
  "sensor_name": "Aruba",
  "port_src": 41008,
  "iface_out": 1073741823,
  "l4_proto": 6,
  "timestamp": %{timestamp},
  "ip_protocol_version": 4,
  "index_replicas": 1,
  "tos": 0,
  "ip_dst": "1.2.3.4",
  "bytes": 64,
  "type": "sflowv5",
  "tcp_flags": "16",
  "wireless_station": "%{ap_mac_address}",
  "client_mac": "%{clientMacAddress}"
}
  ' % { timestamp: timestamp,
        ap_mac_address: ap_mac_address,
        clientMacAddress: clientMacAddress}
  JSON.parse(to_produce).to_json.to_s
end

# This function is duplicated
def make_request(config, uri)
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  request = Net::HTTP::Get.new(uri.request_uri)
  request.basic_auth config['ale_api_user'], config['ale_api_password']
  http.request(request)
end

def get_access_point_info(config, uri)
  result = Array.new
  response = make_request(config, uri)
  if response.code == '200'
    result_json = JSON.parse(response.body)
    ap_topology = result_json['Topology_result']
    ap_topology.each do |top|
      ap_controller = top['msg']['controller']
      if config['controller_ip'].eql? ap_controller['controller_ip_address.addr']
        ap_controller['access_points'].each do |accesspoint|
          ap_radios = accesspoint['radios']
          if ap_radios.nil?
            p "radios is nil!"
          else
            ap_mac = accesspoint['ap_eth_mac.addr'].tr(".",":")
            result.push(ap_mac)
          end
        end
      end
    end
  else
    p "could not retrieve access_point information from #{config['ale_ip']}"
  end

  result
end

# TODO: Move this helper function to helper module
def check_ap_status(config)
  p '------ Checking AP Status .. ------'
  begin
    config.each do |ale|
      p "check ap status : #{ale['ale_sensor']['ale_ip']}:#{ale['ale_sensor']['ale_port']}"
      uri = URI.parse('https://'+ale['ale_sensor']['ale_ip']+ale['ale_sensor']['topology_uri'])
      p "Uri is: #{uri}"
      access_points = get_access_point_info(ale['ale_sensor'],uri)
      p "Checking the access_points is #{access_points}"
      ##For each access_point send a message to rb_state topic
      access_points.each do |ap_mac_address|
        status_json_msg = get_sample_rb_status(ap_mac_address.downcase)
        produce_to_kafka(status_json_msg, 'rb_state')
        p status_json_msg
      end
    end
  rescue
    p 'Could not get ALE sensors, checking all statuses failed'
  end
end

# Check AP status every 5 minutes
Thread.new do
  loop do
    check_ap_status(config) if config
    sleep 300
  end
end

p 'Waiting for messages..'
loop do
  # reads the "location" topic
  subscriber.recv_string(string = '')

  # reads the event
  subscriber.recv_string(string = '')
  next if string.empty?

  # Get the message from the ALE ZMQ
  message = Ce::Nbapi::Nb_event.new
  message = message.parse_from_string(string)

  # Pick the Floor and continue if its interesting
  # p "message is #{message}"
  radio_ap_mac_address = message.location ? message.location.records.first.radio_mac.addr.unpack('H*').join.scan(/.{2}/).join(':') : ''
  # p "radio_ap_mac_address is #{radio_ap_mac_address}"
  # p "ap_radius is #{ap_radios.keys}"
  ap_mac_address = (ap_radios.key?(radio_ap_mac_address.upcase) ? ap_radios[radio_ap_mac_address.upcase][:mac] : '')
  # p "ap_mac_address is #{ap_mac_address}"
  next if ap_mac_address.empty?

  ap_hierarchy = (ap_radios.key?(radio_ap_mac_address.upcase) ? ap_radios[radio_ap_mac_address.upcase][:hierarchy] : '')
  # p "ap_hierarchy is #{ap_hierarchy}"
  ap_floor_location = (ap_radios.key?(radio_ap_mac_address.upcase) ? ap_radios[radio_ap_mac_address.upcase][:floor_location] : '')
  # p "ap_floor_location is #{ap_floor_location}"

  # Print msg to send in json
  json_msg = nb_event_to_MSE_looks_like_json(message, ap_mac_address, ap_hierarchy, ap_floor_location)
  # p json_msg

  # Produce to kafka topic rb_loc (default)
  produce_to_kafka(json_msg)

  # Flow message for testing
  # THIS SHIT SHOULD BE COMMENTED!!! or moved to test for being possitive
  flow_json_msg = get_sample_rb_flow(message, ap_mac_address.downcase)
  produce_to_kafka(flow_json_msg, 'rb_flow')
end
