#!/usr/bin/env ruby

require "rubygems"
require "json"
require "net/https"
require "openssl"
require "uri"
require 'yaml'
require 'time'
require 'pg'

def write_last_run_watermark
  begin
    file = File.open('/tmp/rb_scan_ale_last_run', 'w')
    file.write(Time.now.to_s)
  rescue IOError
    # some error occur, dir not writable etc.
  ensure
    file.close unless file.nil?
  end
end

write_last_run_watermark

# Method to output to json file
def write_config_file(hash, filename)
  p "writing config file : #{filename}"
  File.open(filename, 'w') do |f|
    f.write(JSON.pretty_generate(hash))
  end
  p "config file #{filename} created"
end

def get_ap_position_from_database(mac)
  mac_address = mac.downcase
  ap = @database_aps.select{|ap| ap["mac_address"] == mac_address }.first rescue nil
  return "0.0;0.0" if ap.nil?
  latitude = ap['latitude']
  longitude = ap['longitude']
  return "0.0;0.0" if latitude.nil? or longitude.nil? or latitude.empty? or longitude.empty?
  return "#{latitude};#{longitude}"
end

def get_hierarchy_from_database(mac)
  mac_address = mac.downcase
  # Find the AP
  ap = @database_aps.select{|ap| ap["mac_address"] == mac_address }.first rescue nil
  return if ap.nil?
  puts "Sensor id is #{ap['sensor_id']}"
  # Find the Floor
  floor = @database_sensors.select{|s| s["id"] == ap["sensor_id"].to_s and s["domain_type"] == "101" }.first rescue nil
  #puts "<floor>"
  #puts floor
  #puts "</floor>"
  return if floor.nil?
  puts "Floor parent_idis #{floor['parent_id']}"
  # Find the Building
  building = @database_sensors.select{|s| s["id"] == floor["parent_id"] and s["domain_type"] == "5" }.first rescue nil
  return if building.nil?
  puts "Building parent_id is #{building['parent_id']}"
  # Find the Campus
  campus = @database_sensors.select{|s| s["id"] == building["parent_id"] and s["domain_type"] == "4" }.first rescue nil
  return if campus.nil?
  puts "Campus name is #{floor['name']}"
  return "#{campus['name']}>#{building['name']}>#{floor['name']}"
end


def make_request(uri,config)
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  request = Net::HTTP::Get.new(uri.request_uri)
  request.basic_auth config['ale_api_user'], config['ale_api_password']
  response = http.request(request)
end

def get_hierarchy_info(config,type,uri)

  result = Hash.new
  response = make_request(uri,config)
  if (response.code == "200")
    result_json = JSON.parse(response.body)
    result_json[type+"_result"].each do |br|
      id = br['msg'][type.downcase + '_id']
      name = br['msg'][type.downcase + '_name']
      if type == "Floor"
        location = br['msg']['floor_latitude'].to_s + ";" + br['msg']['floor_longitude'].to_s
        floor_hash = Hash.new
        floor_hash["location"] = location
        floor_hash["name"] = name
        result[id] = floor_hash
      else
        result[id] = name
      end
    end
  else
    puts "could not retrieve #{type} information from #{config['ale_ip']}"
  end

  result
end

#Let's check whether we are in Centos 6 or 7
begin
  if File.exist?('/usr/bin/rb_scan_ale.rb')         # Centos 7
    centos7 = TRUE
  elsif File.exist?('/opt/rb/bin/rb_scan_ale.rb')   # Centos 6
    centos7 = FALSE
  else
    raise StandardError
  end
rescue StandardError
  p "rb_scan_ale.rb cannot be found"
  p "It must be in:"
  p "  /opt/rb/bin/rb_scan_ale.rb (Centos 6)"
  p "           or"
  p "  /usr/bin/rb_scan_ale.rb    (Centos 7)"
  p "Exiting..."
  exit
end

if centos7
  p "Loading postgresql database from /var/www/rb-rails/config/database.yml"
  pg_config = YAML.load_file('/var/www/rb-rails/config/database.yml') rescue nil
else
  p "Loading postgresql database from /opt/rb/var/www/rb-rails/config/database.yml"
  pg_config = YAML.load_file('/opt/rb/var/www/rb-rails/config/database.yml') rescue nil
end

p "Error loading the postgresql database config file" and exit if pg_config.nil?
@dabase_aps,@database_sensors = nil
begin
  connection = PG::Connection.new(:host =>     pg_config["production"]["host"],
                                  :port =>     pg_config["production"]["port"],
                                  :dbname =>   pg_config["production"]["database"],
                                  :user =>     pg_config["production"]["username"],
                                  :password => pg_config["production"]["password"])
  @database_aps = connection.exec("select * from access_points")
  @database_sensors = connection.exec("select * from sensors")
rescue
  p "Something went wrong!"
ensure
  connection.close
end

p "No sensors or access points defined in the Manager!" and exit if @database_aps.nil? or @database_aps.count == 0 or @database_sensors.nil? or @database_sensors.count == 0

if centos7
  p "Loading sensors from /etc/redborder-ale/config.yml..."
  config = YAML.load_file('/etc/redborder-ale/config.yml')
else
  p "Loading sensors from /opt/rb/etc/rb-ale/config.yml..."
  config = YAML.load_file('/opt/rb/etc/rb-ale/config.yml')
end

# store the accesspoints and radios in hash
aps = Hash.new

config.each do |ale|
  ale = ale['ale_sensor']

  # Get campus..
  uri = URI.parse('https://'+ale['ale_ip']+ale['campus_uri'])
  campus = get_hierarchy_info(ale,"Campus",uri)

  # Get Buildings..
  uri = URI.parse('https://'+ale['ale_ip']+ale['building_uri'])
  buildings = get_hierarchy_info(ale,"Building",uri)

  # Get Floors..
  uri = URI.parse('https://'+ale['ale_ip']+ale['floor_uri'])
  floors = get_hierarchy_info(ale,"Floor",uri)

  # Build the APs list
  uri = URI.parse('https://'+ale['ale_ip']+ale['topology_uri'])
  response = make_request(uri,ale)

  if response.code == '200'
    result = JSON.parse(response.body)
    topology = result['Topology_result']
    puts "*+*******"
    puts topology.to_s
    puts "**********"
    # loop over the topology information and retrieve the radio information of the accesspoints
    topology.each do |top|
      controller = top['msg']['controller']

      puts "the controller is.. #{controller.to_s}"
      if (ale['controller_ip'].eql?controller['controller_ip_address.addr'])
        p "add new controller #{controller['controller_ip_address.addr']} to config file"

        controller['access_points'].each do |accesspoint|

          # Get the location info
          ap_location = accesspoint['ap_location']
          campus_name = (!ap_location.nil? and ap_location.key?'campus_id') ? campus[ap_location['campus_id']] : ""
          building_name = (!ap_location.nil? and ap_location.key?'building_id') ? buildings[ap_location['building_id']] : ""
          floor_name = (!ap_location.nil? and ap_location.key?'floor_id' ) ? floors[ap_location['floor_id']]['name'] : ""
          floor_location =  (!ap_location.nil? and ap_location.key?'floor_id') ? floors[ap_location['floor_id']]['location'] : ""

          radios = accesspoint['radios']
          radios.each do |radio|
            next if !radio.key?'virtual_access_points'
            radio['virtual_access_points'].each do |vap|
              values_hash = Hash.new
              values_hash["mac"] = accesspoint['ap_eth_mac.addr'].tr('.',':')
              #values_hash["hierarchy"] = "#{campus_name}>#{building_name}>#{floor_name}"
              values_hash["hierarchy"] = get_hierarchy_from_database(values_hash["mac"])
              #values_hash["floor_location"] = floor_location
              values_hash["floor_location"] = get_ap_position_from_database(values_hash["mac"])
              # We dont store if the hierarchy is not there because is not well defined in the manager
              aps[vap['bssid.addr'].tr('.',':')] =  values_hash unless vap['bssid.addr'].nil? or values_hash["hierarchy"].nil?
            end
          end unless radios.nil?
        end
      end
    end
  else
    p "could not retrieve topology information from #{ale['ale_ip']}"
  end
end

if centos7
  p 'writing information to /etc/redborder-ale/rb_ale_aps.conf'
  write_config_file(aps, '/etc/redborder-ale/rb_ale_aps.conf')
else
  p 'writing information to /opt/rb/etc/rb-ale/rb_ale_aps.conf'
  write_config_file(aps, '/opt/rb/etc/rb-ale/rb_ale_aps.conf')
end
