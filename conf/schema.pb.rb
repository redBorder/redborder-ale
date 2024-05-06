# encoding: utf-8

##
# This file is auto-generated. DO NOT EDIT!
#
require 'protobuf'

module Ce
  module Nbapi
    ::Protobuf::Optionable.inject(self) { ::Google::Protobuf::FileOptions }

    ##
    # Enum Classes
    #
    class Data_prio < ::Protobuf::Enum
      define :DATA_PRIO_BK, 0
      define :DATA_PRIO_BE, 1
      define :DATA_PRIO_VI, 2
      define :DATA_PRIO_VO, 3
    end

    class Traffic_type < ::Protobuf::Enum
      define :DATA_TRAFFIC_TYPE_BCAST, 0
      define :DATA_TRAFFIC_TYPE_MCAST, 1
      define :DATA_TRAFFIC_TYPE_UCAST, 2
    end

    class Ht_type < ::Protobuf::Enum
      define :HTT_NONE, 0
      define :HTT_20MZ, 1
      define :HTT_40MZ, 2
      define :HTT_VHT_20MZ, 3
      define :HTT_VHT_40MZ, 4
      define :HTT_VHT_80MZ, 5
      define :HTT_VHT_160MZ, 6
      define :HTT_VHT_80PLUS80MZ, 7
      define :HTT_INVALID, 8
    end

    class Phy_type < ::Protobuf::Enum
      define :PHY_TYPE_80211B, 0
      define :PHY_TYPE_80211A, 1
      define :PHY_TYPE_80211G, 2
      define :PHY_TYPE_80211AG, 3
      define :PHY_TYPE_INVALID, 4
    end

    class Measurement_unit < ::Protobuf::Enum
      define :METERS, 0
      define :FEET, 1
      define :PIXELS, 2
    end

    class Vpn_tunnel_type < ::Protobuf::Enum
      define :ARUBA_CONTROLLER_TUNNEL, 1
      define :VIG_TUNNEL, 2
    end

    class Target_dev_type < ::Protobuf::Enum
      define :TARGET_TYPE_UNKNOWN, 0
      define :TARGET_TYPE_STATION, 1
      define :TARGET_TYPE_TAG, 2
      define :TARGET_TYPE_UNSECURE, 3
    end

    class Iap_enforcement_status < ::Protobuf::Enum
      define :ENF_PERMIT, 1
      define :ENF_DENY, 2
    end


    ##
    # Message Classes
    #
    class Ip_address < ::Protobuf::Message
      class Addr_family < ::Protobuf::Enum
        define :ADDR_FAMILY_UNSPEC, 0
        define :ADDR_FAMILY_INET, 2
        define :ADDR_FAMILY_INET6, 10
      end

    end

    class Mac_address < ::Protobuf::Message; end
    class Data_rate_stats < ::Protobuf::Message; end
    class Data_prio_stats < ::Protobuf::Message; end
    class Data_traffic_type_stats < ::Protobuf::Message; end
    class Ap_neighbor < ::Protobuf::Message
      class Network_type < ::Protobuf::Enum
        define :INFRASTRUCTURE, 0
        define :ADHOC, 1
      end

    end

    class Util_stats < ::Protobuf::Message
      class Util_stat_type < ::Protobuf::Enum
        define :UTIL_STAT_TYPE_CHANNEL, 0
        define :UTIL_STAT_TYPE_CHANNEL_TX, 1
        define :UTIL_STAT_TYPE_CHANNEL_RX, 2
        define :UTIL_STAT_TYPE_QUEUE_SWTX, 3
        define :UTIL_STAT_TYPE_QUEUE_BE, 4
        define :UTIL_STAT_TYPE_QUEUE_BK, 5
        define :UTIL_STAT_TYPE_QUEUE_VI, 6
        define :UTIL_STAT_TYPE_QUEUE_VO, 7
        define :UTIL_STAT_TYPE_QUEUE_BCMC, 8
        define :UTIL_STAT_TYPE_QUEUE_ATIM, 9
      end

    end

    class Location < ::Protobuf::Message
      class Algorithm < ::Protobuf::Enum
        define :ALGORITHM_TRIANGULATION, 0
        define :ALGORITHM_AP_PLACEMENT, 1
        define :ALGORITHM_CALIBRATION, 2
        define :ALGORITHM_ESTIMATION, 3
        define :ALGORITHM_LOW_DENSITY, 4
      end

      class Error_code < ::Protobuf::Enum
        define :ERROR_CODE_NO_ERROR, 0
        define :ERROR_CODE_0_RSSI, 1
        define :ERROR_CODE_ONLY_1_RSSI, 2
        define :ERROR_CODE_ONLY_2_RSSI, 3
        define :ERROR_CODE_RSSI_QUALITY, 4
        define :ERROR_CODE_RSSI_OLD_TIMESTAMP, 8
        define :ERROR_CODE_RSSI_CLOSE_TIMESTAMP, 16
        define :ERROR_CODE_LEGACY, 1048575
      end

      class Record < ::Protobuf::Message; end

    end

    class Presence < ::Protobuf::Message; end
    class Rssi < ::Protobuf::Message; end
    class Sta_rssi < ::Protobuf::Message; end
    class Ap_rssi < ::Protobuf::Message; end
    class Station < ::Protobuf::Message; end
    class Access_point < ::Protobuf::Message
      class Deployment_mode < ::Protobuf::Enum
        define :DEPLOYMENT_MODE_CAMPUS, 0
        define :DEPLOYMENT_MODE_REMOTE, 1
      end

    end

    class State_access_point < ::Protobuf::Message; end
    class Stats_modem < ::Protobuf::Message; end
    class Radio < ::Protobuf::Message
      class Radio_mode < ::Protobuf::Enum
        define :RADIO_MODE_AP, 0
        define :RADIO_MODE_MESH_PORTAL, 1
        define :RADIO_MODE_MESH_POINT, 2
        define :RADIO_MODE_AIR_MONITOR, 3
        define :RADIO_MODE_SPECTRUM_SENSOR, 4
        define :RADIO_MODE_UNKNOWN, 5
      end

    end

    class Virtual_access_point < ::Protobuf::Message; end
    class Destination < ::Protobuf::Message; end
    class Application < ::Protobuf::Message; end
    class Webcc_category < ::Protobuf::Message; end
    class Webcc_info < ::Protobuf::Message; end
    class Visibility_rec < ::Protobuf::Message
      class Ip_protocol < ::Protobuf::Enum
        define :IP_PROTOCOL_VAL_6, 6
        define :IP_PROTOCOL_VAL_17, 17
      end

      class IapAppEnforcementStatus < ::Protobuf::Enum
        define :ENF_PERMIT, 1
        define :ENF_DENY, 2
      end

    end

    class Campus < ::Protobuf::Message; end
    class Building < ::Protobuf::Message; end
    class Floor < ::Protobuf::Message; end
    class Point < ::Protobuf::Message; end
    class Geofence < ::Protobuf::Message; end
    class Geofence_notify < ::Protobuf::Message
      class Zone_event < ::Protobuf::Enum
        define :ZONE_IN, 0
        define :ZONE_OUT, 1
      end

      class Access_point_info < ::Protobuf::Message; end

    end

    class Stats_radio < ::Protobuf::Message
      class Radio_mode < ::Protobuf::Enum
        define :RADIO_MODE_AP, 0
        define :RADIO_MODE_MESH_PORTAL, 1
        define :RADIO_MODE_MESH_POINT, 2
        define :RADIO_MODE_AIR_MONITOR, 3
        define :RADIO_MODE_SPECTRUM_SENSOR, 4
        define :RADIO_MODE_UNKNOWN, 5
      end

    end

    class Stats_vap < ::Protobuf::Message; end
    class Stats_station < ::Protobuf::Message; end
    class State_station < ::Protobuf::Message; end
    class Uplink_bandwidth < ::Protobuf::Message; end
    class Uplink_info < ::Protobuf::Message; end
    class Stats_uplink < ::Protobuf::Message; end
    class Wan_comp_uplink < ::Protobuf::Message; end
    class Stats_ip_probe_uplink < ::Protobuf::Message; end
    class Stats_tunnel < ::Protobuf::Message; end
    class Bytes_info < ::Protobuf::Message; end
    class Iap_bytes_info < ::Protobuf::Message; end
    class Stats_role_iap < ::Protobuf::Message; end
    class Stats_vlan_iap < ::Protobuf::Message; end
    class Stats_ssid_iap < ::Protobuf::Message; end
    class Stats_port < ::Protobuf::Message; end
    class Summary_webcat_iap < ::Protobuf::Message; end
    class Summary_appid_iap < ::Protobuf::Message; end
    class Summary_webrep_iap < ::Protobuf::Message; end
    class Ap_neighbor_list < ::Protobuf::Message; end
    class Utilization_stats_radio < ::Protobuf::Message; end
    class Proximity < ::Protobuf::Message; end
    class Dot1x < ::Protobuf::Message; end
    class Wpa_key_handshake < ::Protobuf::Message; end
    class Captive_portal < ::Protobuf::Message; end
    class Macauth < ::Protobuf::Message; end
    class Auth_srvr_timeout < ::Protobuf::Message; end
    class Security_message < ::Protobuf::Message
      class Security_msg_type < ::Protobuf::Enum
        define :AUTH_SRVR_TIMEOUT_MSG, 0
        define :MACAUTH_MSG, 1
        define :CAPTIVE_PORTAL_MSG, 2
        define :WPA_KEY_HANDSHAKE_MSG, 3
        define :DOT1X_MSG, 4
        define :UNKNOWN_MSG, 5
      end

    end

    class Spectrum_info < ::Protobuf::Message; end
    class Rogue_info < ::Protobuf::Message; end
    class Key_value_type < ::Protobuf::Message; end
    class Info < ::Protobuf::Message
      class Mode_type < ::Protobuf::Enum
        define :CONTEXT, 0
        define :CONTEXT_AND_LOCATION_WITH_CALIBRATION, 1
        define :CONTEXT_AND_ESTIMATED_LOCATION, 2
      end

    end

    class Controller_info < ::Protobuf::Message; end
    class Cluster_info < ::Protobuf::Message; end
    class Topology < ::Protobuf::Message; end
    class Ap_location < ::Protobuf::Message; end
    class Nb_event < ::Protobuf::Message
      class Event_operation < ::Protobuf::Enum
        define :OP_ADD, 0
        define :OP_UPDATE, 1
        define :OP_DELETE, 2
        define :OP_SYNC, 3
      end

      class License_info < ::Protobuf::Enum
        define :Hb_Dhak, 10
        define :Hb_LimitOk, 11
        define :Hb_ThresholdXNotice, 20
        define :Hb_ThresholdOkNotice, 21
        define :Hb_LicenseExceeded, 31
        define :Hb_EvalStarted, 41
        define :Hb_NewLimitExceeded, 51
        define :Hb_EvalDone, 61
        define :Hb_ALSOnline, 71
        define :Hb_ALSDieing, 81
        define :Hb_LICENSE_BLOCKED, 91
      end

    end

    class Query_response < ::Protobuf::Message
      class Location_result < ::Protobuf::Message; end
      class Presence_result < ::Protobuf::Message; end
      class Rssi_result < ::Protobuf::Message; end
      class Station_result < ::Protobuf::Message; end
      class Radio_result < ::Protobuf::Message; end
      class Destination_result < ::Protobuf::Message; end
      class Application_result < ::Protobuf::Message; end
      class Visibility_rec_result < ::Protobuf::Message; end
      class Campus_result < ::Protobuf::Message; end
      class Building_result < ::Protobuf::Message; end
      class Floor_result < ::Protobuf::Message; end
      class Access_point_result < ::Protobuf::Message; end
      class Virtual_access_point_result < ::Protobuf::Message; end
      class Geofence_result < ::Protobuf::Message; end
      class Proximity_result < ::Protobuf::Message; end
      class WebCCCategory_result < ::Protobuf::Message; end
      class Info_result < ::Protobuf::Message; end
      class Topology_result < ::Protobuf::Message; end
      class Controller_result < ::Protobuf::Message; end
      class Cluster_result < ::Protobuf::Message; end
      class Access_point_location_result < ::Protobuf::Message; end

    end

    class Iap_client_url < ::Protobuf::Message; end
    class Url_detail_record < ::Protobuf::Message
      class Url_http_method < ::Protobuf::Enum
        define :NON_HTTP, 1
        define :HTTP_GET, 2
        define :HTTP_PUT, 3
        define :HTTP_POST, 4
        define :HTTP_HEAD, 5
      end

    end

    class Iap_message_info < ::Protobuf::Message; end
    class Air_monitor_info < ::Protobuf::Message; end
    class Air_monitor_rogue_info < ::Protobuf::Message; end


    ##
    # File Options
    #
    set_option :java_package, "com.aruba.ale.proto"


    ##
    # Message Fields
    #
    class Ip_address
      required ::Ce::Nbapi::Ip_address::Addr_family, :af, 1
      required :bytes, :addr, 2
    end

    class Mac_address
      required :bytes, :addr, 1
    end

    class Data_rate_stats
      optional :uint32, :rate, 1
      optional :uint32, :tx_frame_count, 2
      optional :uint32, :tx_byte_count, 3
      optional :uint32, :rx_frame_count, 4
      optional :uint32, :rx_byte_count, 5
    end

    class Data_prio_stats
      optional ::Ce::Nbapi::Data_prio, :prio, 1
      optional :uint32, :tx_frame_count, 2
      optional :uint32, :rx_frame_count, 3
      optional :uint32, :tx_drop_count, 4
    end

    class Data_traffic_type_stats
      optional ::Ce::Nbapi::Traffic_type, :type, 1
      optional :uint32, :tx_frame_count, 2
      optional :uint32, :rx_frame_count, 3
    end

    class Ap_neighbor
      optional ::Ce::Nbapi::Mac_address, :ap_eth_mac, 1
      optional ::Ce::Nbapi::Mac_address, :bssid, 2
      optional ::Ce::Nbapi::Phy_type, :phy, 3
      optional ::Ce::Nbapi::Mac_address, :neighbor_bssid, 4
      optional :string, :neighbor_ssid, 5
      optional ::Ce::Nbapi::Ap_neighbor::Network_type, :neighbor_network, 6
      optional :uint32, :neighbor_channel, 7
      optional :uint32, :neighbor_rssi, 10
    end

    class Util_stats
      optional ::Ce::Nbapi::Util_stats::Util_stat_type, :type, 1
      optional :uint32, :bucket1, 2
      optional :uint32, :bucket2, 3
      optional :uint32, :bucket3, 4
      optional :uint32, :bucket4, 5
      optional :uint32, :bucket5, 6
      optional :uint32, :max, 7
      optional :uint32, :min, 8
      optional :uint32, :curr, 9
      optional :uint64, :stat, 10
    end

    class Location
      class Record
        required :uint32, :timestamp, 1
        required ::Ce::Nbapi::Mac_address, :radio_mac, 2
        required :int32, :rssi_val, 3
        optional :uint32, :channel, 4
      end

      optional ::Ce::Nbapi::Mac_address, :sta_eth_mac, 1
      optional :float, :sta_location_x, 2
      optional :float, :sta_location_y, 3
      optional :uint32, :error_level, 7
      optional :bool, :associated, 8
      optional :bytes, :campus_id, 9
      optional :bytes, :building_id, 10
      optional :bytes, :floor_id, 11
      optional :bytes, :hashed_sta_eth_mac, 12
      repeated :bytes, :geofence_ids, 13
      optional ::Ce::Nbapi::Location::Algorithm, :loc_algorithm, 14
      optional :uint32, :rssi_val, 15
      optional :double, :longitude, 16
      optional :double, :latitude, 17
      optional :double, :altitude, 18
      optional ::Ce::Nbapi::Measurement_unit, :unit, 19
      optional ::Ce::Nbapi::Target_dev_type, :target_type, 20, :default => ::Ce::Nbapi::Target_dev_type::TARGET_TYPE_STATION
      optional ::Ce::Nbapi::Location::Error_code, :err_code, 21
      repeated ::Ce::Nbapi::Location::Record, :records, 22
    end

    class Presence
      optional ::Ce::Nbapi::Mac_address, :sta_eth_mac, 1
      optional :bool, :associated, 2
      optional :bytes, :hashed_sta_eth_mac, 3
      optional :string, :ap_name, 4
      optional ::Ce::Nbapi::Mac_address, :radio_mac, 5
      optional ::Ce::Nbapi::Target_dev_type, :target_type, 6, :default => ::Ce::Nbapi::Target_dev_type::TARGET_TYPE_STATION
    end

    class Rssi
      optional ::Ce::Nbapi::Mac_address, :sta_eth_mac, 1
      optional ::Ce::Nbapi::Mac_address, :radio_mac, 2
      optional :uint32, :rssi_val, 3
      optional :bool, :associated, 4
      optional :bytes, :hashed_sta_eth_mac, 5
      optional :uint32, :noise_floor, 6
      optional :bool, :is_ap, 7
      optional :uint32, :age, 8
      optional :uint32, :classification_type, 9
    end

    class Sta_rssi
      optional ::Ce::Nbapi::Mac_address, :sta_eth_mac, 1
      optional ::Ce::Nbapi::Mac_address, :radio_mac, 2
      optional :sint32, :rssi_val, 3
      optional :bool, :associated, 4
      optional :int32, :age, 5
      optional :int32, :noise_floor, 6
      optional ::Ce::Nbapi::Mac_address, :assoc_bssid, 7
      optional :uint32, :classification_type, 8
    end

    class Ap_rssi
      optional ::Ce::Nbapi::Mac_address, :ap_eth_mac, 1
      optional ::Ce::Nbapi::Mac_address, :neighbor_bssid, 2
      optional :string, :ssid, 3
      optional :sint32, :rssi_val, 4
      optional :uint32, :phy_type, 5
      optional :uint32, :ht_mode, 6
      optional :uint32, :channel, 7
      optional :uint32, :tx_power, 8
      optional :int64, :bw_rate, 9
      optional ::Ce::Nbapi::Mac_address, :bssid, 10
      optional :uint32, :classification_type, 11
    end

    class Station
      optional ::Ce::Nbapi::Mac_address, :sta_eth_mac, 1
      optional :string, :username, 2
      optional :string, :role, 3
      optional ::Ce::Nbapi::Mac_address, :bssid, 4
      optional :string, :device_type, 5
      optional ::Ce::Nbapi::Ip_address, :sta_ip_address, 6
      optional :bytes, :hashed_sta_eth_mac, 7
      optional :bytes, :hashed_sta_ip_address, 8
      optional :uint32, :vlan, 9
      optional ::Ce::Nbapi::Ht_type, :ht, 10
      optional :string, :ap_name, 11
    end

    class Access_point
      required ::Ce::Nbapi::Mac_address, :ap_eth_mac, 1
      optional :string, :ap_name, 2
      optional :string, :ap_group, 3
      optional :string, :ap_model, 4
      optional ::Ce::Nbapi::Access_point::Deployment_mode, :depl_mode, 5
      optional ::Ce::Nbapi::Ip_address, :ap_ip_address, 6
      optional :uint32, :reboots, 7
      optional :uint32, :rebootstraps, 8
      optional ::Ce::Nbapi::Ip_address, :managed_by, 9
      optional :string, :managed_by_key, 10
      repeated ::Ce::Nbapi::Radio, :radios, 11
      optional :bool, :is_master, 12
      optional :string, :reboot_reason, 13
      optional ::Ce::Nbapi::Ap_location, :ap_location, 14
    end

    class State_access_point
      optional ::Ce::Nbapi::Mac_address, :ap_mac, 1
      optional :string, :serial_number, 2
      optional :string, :ap_name, 3
      optional :string, :model, 4
      optional :string, :mode, 5
      optional ::Ce::Nbapi::Ip_address, :ap_ip, 6
      optional :uint32, :cpu_usage, 7
      optional :uint32, :memory_total, 8
      optional :uint32, :memory_free, 9
      optional :uint32, :is_master, 10
      optional :uint32, :uptime, 11
      optional :uint32, :mesh_mode, 12
      optional :uint32, :led_status, 13
      optional :uint32, :ext_ssid_state, 16
      optional :string, :service_tag, 17
      optional :uint32, :modem_status, 18
      optional :uint32, :modem_simpin_status, 19
      optional :uint32, :current_uplink_inuse, 20
    end

    class Stats_modem
      optional ::Ce::Nbapi::Mac_address, :iap_mac, 1
      optional :uint64, :tx_data_bytes, 2
      optional :uint64, :rx_data_bytes, 3
    end

    class Radio
      optional ::Ce::Nbapi::Mac_address, :ap_eth_mac, 1
      required ::Ce::Nbapi::Mac_address, :radio_bssid, 2
      optional ::Ce::Nbapi::Radio::Radio_mode, :mode, 4
      optional ::Ce::Nbapi::Phy_type, :phy, 5
      optional ::Ce::Nbapi::Ht_type, :ht, 6
      repeated ::Ce::Nbapi::Virtual_access_point, :virtual_access_points, 7
      optional :uint32, :radio_num, 8
    end

    class Virtual_access_point
      required ::Ce::Nbapi::Mac_address, :bssid, 1
      optional :string, :ssid, 2
      optional ::Ce::Nbapi::Mac_address, :radio_bssid, 3
    end

    class Destination
      optional ::Ce::Nbapi::Ip_address, :dest_ip, 1
      optional :string, :dest_name, 2
      optional :string, :dest_alias_name, 3
    end

    class Application
      optional :uint32, :app_id, 1
      optional :string, :app_name, 2
      optional :string, :app_family, 3
      optional :string, :app_long_name, 4
    end

    class Webcc_category
      optional :uint32, :cat_id, 1
      optional :string, :category, 2
    end

    class Webcc_info
      optional :bytes, :webcc_md5, 1
      optional :uint32, :webcc_cat_id, 2
      optional :uint32, :webcc_rep_score, 3
      optional :string, :webcc_url_prefix, 4
      optional :bool, :webcc_not_supported, 5
    end

    class Visibility_rec
      optional ::Ce::Nbapi::Ip_address, :client_ip, 1
      optional ::Ce::Nbapi::Ip_address, :dest_ip, 2
      optional ::Ce::Nbapi::Visibility_rec::Ip_protocol, :ip_proto, 3
      optional :uint32, :app_id, 4
      optional :uint64, :tx_pkts, 5
      optional :uint64, :tx_bytes, 6
      optional :uint64, :rx_pkts, 7
      optional :uint64, :rx_bytes, 8
      optional :bytes, :hashed_client_ip, 9
      optional ::Ce::Nbapi::Mac_address, :device_mac, 10
      optional :bytes, :hashed_device_mac, 11
      optional :string, :app_name, 12
      optional :uint32, :cc_cat_id, 13
      optional :uint32, :cc_rep_score, 14
      optional :string, :cc_url_prefix, 15
      optional :bytes, :cc_md5, 16
      optional ::Ce::Nbapi::Mac_address, :ap_mac, 17
      optional ::Ce::Nbapi::Visibility_rec::IapAppEnforcementStatus, :session_flags, 18
    end

    class Campus
      optional :bytes, :campus_id, 1
      optional :string, :campus_name, 2
    end

    class Building
      optional :bytes, :building_id, 1
      optional :string, :building_name, 2
      optional :bytes, :campus_id, 3
    end

    class Floor
      optional :bytes, :floor_id, 1
      optional :string, :floor_name, 2
      optional :float, :floor_latitude, 3
      optional :float, :floor_longitude, 4
      optional :string, :floor_img_path, 5
      optional :float, :floor_img_width, 6
      optional :float, :floor_img_length, 7
      optional :bytes, :building_id, 8
      optional :float, :floor_level, 9
      optional :string, :units, 10
      optional :float, :grid_size, 11
    end

    class Point
      optional :float, :x, 1
      optional :float, :y, 2
    end

    class Geofence
      optional :bytes, :floor_id, 1
      optional :bytes, :geofence_id, 2
      optional :string, :geofence_name, 3
      optional :string, :type, 4
      repeated ::Ce::Nbapi::Point, :point_list, 5
    end

    class Geofence_notify
      class Access_point_info
        optional ::Ce::Nbapi::Mac_address, :ap_mac, 8
        optional :string, :ap_name, 9
        optional ::Ce::Nbapi::Mac_address, :radio_bssid, 10
        optional :uint32, :rssi_val, 11
      end

      optional ::Ce::Nbapi::Geofence_notify::Zone_event, :geofence_event, 1
      optional :bytes, :geofence_id, 2
      optional :string, :geofence_name, 3
      optional ::Ce::Nbapi::Mac_address, :sta_mac, 4
      optional :bool, :associated, 5
      optional :uint32, :dwell_time, 6, :default => 0
      repeated ::Ce::Nbapi::Geofence_notify::Access_point_info, :access_point_info, 7
      optional :bytes, :hashed_sta_mac, 30
    end

    class Stats_radio
      optional ::Ce::Nbapi::Mac_address, :ap_eth_mac, 1
      optional :uint32, :radio_number, 2
      optional :uint32, :channel, 3
      optional ::Ce::Nbapi::Phy_type, :phy, 4
      optional ::Ce::Nbapi::Stats_radio::Radio_mode, :mode, 5
      optional :uint32, :noise_floor, 7
      optional :uint32, :tx_power, 8
      optional :uint32, :channel_utilization, 9
      optional :uint32, :rx_channel_utilization, 10
      optional :uint32, :tx_channel_utilization, 11
      optional :uint32, :tx_received, 12
      optional :uint32, :tx_transmitted, 13
      optional :uint32, :tx_dropped, 14
      optional :uint32, :tx_data_received, 15
      optional :uint32, :tx_data_transmitted, 16
      optional :uint32, :tx_data_retried, 17
      optional :uint32, :rx_frames, 18
      optional :uint32, :rx_retried, 19
      optional :uint32, :rx_data_frames, 20
      optional :uint32, :rx_data_retried, 21
      optional :uint32, :rx_frame_errors, 22
      repeated ::Ce::Nbapi::Data_traffic_type_stats, :traffic_stats, 23
      repeated ::Ce::Nbapi::Data_prio_stats, :prio_stats, 24
      repeated ::Ce::Nbapi::Data_rate_stats, :rate_stats, 25
      optional :uint32, :actual_eirp, 26
      optional ::Ce::Nbapi::Mac_address, :radio_mac, 27
      optional :uint64, :tx_data_bytes, 28
      optional :uint64, :rx_data_bytes, 29
      optional :uint32, :radio_band, 30
      optional :uint32, :channel_busy_64, 31
      optional :uint32, :sta_number, 32
    end

    class Stats_vap
      optional ::Ce::Nbapi::Mac_address, :ap_eth_mac, 1
      optional ::Ce::Nbapi::Mac_address, :bssid, 2
      optional :uint32, :tx_received, 5
      optional :uint32, :tx_transmitted, 6
      optional :uint32, :tx_dropped, 7
      optional :uint32, :tx_data_received, 8
      optional :uint32, :tx_data_transmitted, 9
      optional :uint32, :tx_data_retried, 10
      optional :uint32, :rx_frames, 18
      optional :uint32, :rx_retried, 19
      optional :uint32, :rx_data_frames, 11
      optional :uint32, :rx_data_retried, 12
      repeated ::Ce::Nbapi::Data_traffic_type_stats, :traffic_stats, 23
      repeated ::Ce::Nbapi::Data_prio_stats, :prio_stats, 13
      repeated ::Ce::Nbapi::Data_rate_stats, :rate_stats, 14
      optional :uint32, :sta_number, 15
    end

    class Stats_station
      optional ::Ce::Nbapi::Mac_address, :sta_eth_mac, 1
      optional ::Ce::Nbapi::Mac_address, :ap_eth_mac, 2
      optional ::Ce::Nbapi::Mac_address, :bssid, 3
      optional :uint32, :snr, 4
      optional :uint32, :tx_received, 5
      optional :uint32, :tx_transmitted, 6
      optional :uint32, :tx_dropped, 7
      optional :uint32, :tx_data_received, 8
      optional :uint32, :tx_data_transmitted, 9
      optional :uint32, :tx_data_retried, 10
      optional :uint32, :rx_data_received, 11
      optional :uint32, :rx_data_retried, 12
      repeated ::Ce::Nbapi::Data_prio_stats, :prio_stats, 13
      repeated ::Ce::Nbapi::Data_rate_stats, :rate_stats, 14
      optional :uint32, :speed, 15
      optional :uint64, :rx_rate, 16
      optional :uint64, :tx_rate, 17
      optional :uint64, :rx_data_bytes, 18
      optional :uint64, :tx_data_bytes, 19
      optional :uint32, :ssid_up, 20
      optional :bytes, :hashed_sta_eth_mac, 22
      optional :uint64, :max_tx_rate, 23
      optional :uint64, :tx_data_bytes_transmitted, 24
      optional :uint32, :tx_time_data, 25
      optional :uint32, :rx_time_data, 26
      optional :uint32, :sta_client_health, 27
      optional :uint32, :rx_retries, 28
      optional :uint32, :tx_retries, 29
    end

    class State_station
      optional ::Ce::Nbapi::Mac_address, :sta_eth_mac, 1
      optional ::Ce::Nbapi::Mac_address, :ap_eth_mac, 2
      optional :uint32, :snr, 3
      optional :uint32, :rx_tries, 4
      optional :uint32, :tx_tries, 5
      optional ::Ce::Nbapi::Phy_type, :phy_type, 6
      optional :uint32, :security_type, 7
      optional :bytes, :hashed_sta_eth_mac, 8
    end

    class Uplink_bandwidth
      optional ::Ce::Nbapi::Ip_address, :server_ip, 1
      optional :uint32, :server_port, 2
      optional ::Ce::Nbapi::Ip_address, :local_ip, 3
      optional :uint32, :local_port, 4
      optional ::Ce::Nbapi::Mac_address, :ap_mac, 5
      optional :string, :ap_name, 6
      optional :uint64, :timestamp, 7
      optional :string, :protocol, 8
      optional :uint32, :interval, 9
      optional :uint32, :upstream_bytes, 10
      optional :uint32, :upstream_bandwidth, 11
      optional :uint32, :upstream_retries, 12
      optional :uint32, :downstream_bytes, 13
      optional :uint32, :downstream_bandwidth, 14
      optional :uint32, :downstream_retries, 15
      optional :uint32, :upstream_datagrams, 16
      optional :uint32, :downstream_datagrams, 17
      optional :string, :upstream_jitter, 18
      optional :string, :downstream_jitter, 19
      optional :uint32, :upstream_lost_packets, 20
      optional :uint32, :downstream_lost_packets, 21
      optional :bytes, :hashed_ap_eth_mac, 22
    end

    class Uplink_info
      optional ::Ce::Nbapi::Mac_address, :device_mac, 1
      optional :uint64, :link_id, 2
      optional :string, :desc, 3
      optional :uint32, :link_status, 4
      optional :uint64, :vlan_id, 5
      optional :string, :port_tunnel_desc, 6
      optional :uint32, :link_prio, 7
      optional :uint32, :wan_status, 8
      optional :uint32, :crypto_type, 9
      optional :uint32, :tunnel_active_status, 10
      optional :uint64, :tunnel_uptime, 11
      optional ::Ce::Nbapi::Ip_address, :peer_tunnel_ip, 12
      optional ::Ce::Nbapi::Ip_address, :tunnel_ip, 13
      optional :string, :tunnel_name, 14
    end

    class Stats_uplink
      optional ::Ce::Nbapi::Mac_address, :device_mac, 1
      optional :uint64, :link_id, 2
      optional :uint64, :rx_pkts, 3
      optional :uint64, :tx_pkts, 4
      optional :uint64, :rx_bytes, 5
      optional :uint64, :tx_bytes, 6
      optional :uint32, :vlan_id, 7
      optional :string, :tunnel_name, 8
    end

    class Wan_comp_uplink
      optional ::Ce::Nbapi::Mac_address, :boc_mac, 1
      optional :uint64, :link_id, 2
      optional :uint64, :tot_comp_bytes, 3
      optional :uint64, :tot_uncomp_bytes, 4
      optional :uint64, :tot_comp_savings, 5
    end

    class Stats_ip_probe_uplink
      optional ::Ce::Nbapi::Mac_address, :device_mac, 1
      optional :uint64, :link_id, 2
      optional ::Ce::Nbapi::Ip_address, :probe_ip_addr, 3
      optional :uint32, :vlan_id, 4
      optional :uint64, :avg_rtt, 5
      optional :uint64, :max_rtt, 6
      optional :uint64, :min_rtt, 7
      optional :uint64, :avg_jitter, 8
      optional :uint64, :max_jitter, 9
      optional :uint64, :min_jitter, 10
      optional :uint64, :mos_quality, 11
      optional :uint32, :probe_status, 12
      optional :uint32, :ip_probe_pkt_loss_pct, 13
      optional :string, :tunnel_name, 14
      optional :uint64, :sd_avg_latency, 15
      optional :uint64, :ds_avg_latency, 16
      optional :uint64, :sd_avg_jitter, 17
      optional :uint64, :ds_avg_jitter, 18
    end

    class Stats_tunnel
      optional :uint32, :tunnel_index, 1
      optional :uint64, :tx_data_pkts, 2
      optional :uint64, :rx_data_pkts, 3
      optional :uint64, :tx_data_bytes, 4
      optional :uint64, :rx_data_bytes, 5
      optional ::Ce::Nbapi::Mac_address, :iap_mac, 6
    end

    class Bytes_info
      optional :uint64, :tx_bytes, 1
      optional :uint64, :rx_bytes, 2
    end

    class Iap_bytes_info
      optional ::Ce::Nbapi::Iap_enforcement_status, :session_flags, 1
      optional ::Ce::Nbapi::Bytes_info, :bytes_info, 2
    end

    class Stats_role_iap
      optional ::Ce::Nbapi::Mac_address, :iap_mac, 1
      optional :bytes, :user_role, 2
      optional ::Ce::Nbapi::Bytes_info, :bytes_info, 3
    end

    class Stats_vlan_iap
      optional ::Ce::Nbapi::Mac_address, :iap_mac, 1
      optional :uint32, :vlan, 2
      optional ::Ce::Nbapi::Bytes_info, :bytes_info, 3
    end

    class Stats_ssid_iap
      optional ::Ce::Nbapi::Mac_address, :iap_mac, 1
      optional :bytes, :essid, 2
      optional ::Ce::Nbapi::Bytes_info, :bytes_info, 3
    end

    class Stats_port
      optional ::Ce::Nbapi::Mac_address, :port_mac, 1
      optional ::Ce::Nbapi::Bytes_info, :bytes_info, 2
    end

    class Summary_webcat_iap
      optional ::Ce::Nbapi::Mac_address, :iap_mac, 1
      optional :uint32, :webcat_id, 2
      optional ::Ce::Nbapi::Iap_bytes_info, :bytes_info, 3
    end

    class Summary_appid_iap
      optional ::Ce::Nbapi::Mac_address, :iap_mac, 1
      optional :uint32, :app_id, 2
      optional ::Ce::Nbapi::Iap_bytes_info, :bytes_info, 3
    end

    class Summary_webrep_iap
      optional ::Ce::Nbapi::Mac_address, :iap_mac, 1
      optional :uint32, :webrep_id, 2
      optional ::Ce::Nbapi::Iap_bytes_info, :bytes_info, 3
    end

    class Ap_neighbor_list
      repeated ::Ce::Nbapi::Ap_neighbor, :neighbor, 1
    end

    class Utilization_stats_radio
      optional ::Ce::Nbapi::Mac_address, :ap_eth_mac, 1
      optional :uint32, :radio_number, 2
      repeated ::Ce::Nbapi::Util_stats, :ustats, 3
    end

    class Proximity
      optional ::Ce::Nbapi::Mac_address, :sta_eth_mac, 1
      optional ::Ce::Nbapi::Mac_address, :radio_mac, 2
      optional :int32, :rssi_val, 3
      optional :string, :ap_name, 4
      optional :bytes, :hashed_sta_eth_mac, 5
      optional ::Ce::Nbapi::Target_dev_type, :target_type, 6, :default => ::Ce::Nbapi::Target_dev_type::TARGET_TYPE_STATION
    end

    class Dot1x
      optional :uint64, :start_timestamp, 1
      optional :uint64, :finish_timestamp, 2
      optional ::Ce::Nbapi::Mac_address, :station_mac, 3
      optional :string, :username, 4
      optional ::Ce::Nbapi::Mac_address, :bssid, 5
      optional :uint32, :result, 6
      optional :uint32, :reason, 7
      optional :uint32, :server_retry_cnt, 8
      optional :uint32, :client_retry_cnt, 9
      optional ::Ce::Nbapi::Ip_address, :serverip, 10
      optional :uint32, :srvr_elapsed_time, 11
      optional :uint32, :clnt_elapsed_time, 12
    end

    class Wpa_key_handshake
      optional :uint64, :start_timestamp, 1
      optional :uint64, :finish_timestamp, 2
      optional ::Ce::Nbapi::Mac_address, :station_mac, 3
      optional ::Ce::Nbapi::Mac_address, :bssid, 4
      optional :uint32, :result, 5
      optional :uint32, :trigger_reason, 6
      optional :uint32, :reason, 7
      optional :uint32, :key1_retry_cnt, 8
      optional :uint32, :key3_retry_cnt, 9
      optional :uint32, :replay_counter_mismatch, 10
    end

    class Captive_portal
      optional :uint64, :start_timestamp, 1
      optional :uint64, :finish_timestamp, 2
      optional ::Ce::Nbapi::Mac_address, :station_mac, 3
      optional :string, :username, 4
      optional ::Ce::Nbapi::Mac_address, :bssid, 5
      optional :uint32, :result, 6
      optional :uint32, :reason, 7
      optional :uint32, :server_retry_cnt, 8
      optional ::Ce::Nbapi::Ip_address, :serverip, 9
      optional ::Ce::Nbapi::Ip_address, :userip, 10
    end

    class Macauth
      optional :uint64, :start_timestamp, 1
      optional :uint64, :finish_timestamp, 2
      optional ::Ce::Nbapi::Mac_address, :station_mac, 3
      optional ::Ce::Nbapi::Mac_address, :bssid, 4
      optional :uint32, :result, 5
      optional :uint32, :reason, 6
      optional :uint32, :server_retry_cnt, 7
      optional ::Ce::Nbapi::Ip_address, :serverip, 8
    end

    class Auth_srvr_timeout
      optional :uint64, :timestamp, 1
      optional ::Ce::Nbapi::Mac_address, :station_mac, 2
      optional ::Ce::Nbapi::Mac_address, :bssid, 3
      optional :uint32, :authtype, 4
      optional :uint32, :retry_cnt, 5
      optional ::Ce::Nbapi::Ip_address, :userip, 6
      optional ::Ce::Nbapi::Ip_address, :serverip, 7
    end

    class Security_message
      optional ::Ce::Nbapi::Security_message::Security_msg_type, :msg_type, 1
      optional ::Ce::Nbapi::Auth_srvr_timeout, :auth_srvr_timeout, 2
      optional ::Ce::Nbapi::Macauth, :macauth, 3
      optional ::Ce::Nbapi::Captive_portal, :captive_portal, 4
      optional ::Ce::Nbapi::Wpa_key_handshake, :wpa_key_handshake, 5
      optional ::Ce::Nbapi::Dot1x, :dot1x, 6
    end

    class Spectrum_info
      optional ::Ce::Nbapi::Mac_address, :ap_mac, 1
      optional :uint32, :radio_number, 2
      optional :uint32, :dev_id, 3
      optional :uint32, :dev_type, 4
      optional :uint32, :low_ch, 5
      optional :uint32, :high_ch, 6
      optional :uint32, :signal, 7
      optional :uint32, :duty_cycle, 8
      optional :uint32, :center_freq, 9
      optional :uint64, :timestamp, 10
      optional :uint64, :active_time, 11
    end

    class Rogue_info
      optional ::Ce::Nbapi::Mac_address, :monitor_mac, 1
      optional ::Ce::Nbapi::Mac_address, :heard_mac, 2
      optional :uint32, :monitor_channel, 3
      optional :uint32, :is_ap, 4
    end

    class Key_value_type
      optional :string, :key, 1
      optional :string, :value, 2
    end

    class Info
      optional ::Ce::Nbapi::Info::Mode_type, :current_mode, 1
      optional :bool, :license_valid, 2
      repeated ::Ce::Nbapi::Key_value_type, :key_value, 3
    end

    class Controller_info
      required ::Ce::Nbapi::Ip_address, :controller_ip_address, 1
      repeated ::Ce::Nbapi::Access_point, :access_points, 2
    end

    class Cluster_info
      optional :string, :cluster_key, 1
      optional :string, :cluster_name, 2
      optional :string, :organization, 3
      optional ::Ce::Nbapi::Ip_address, :cluster_ip, 4
      repeated ::Ce::Nbapi::Access_point, :access_points, 5
    end

    class Topology
      optional ::Ce::Nbapi::Controller_info, :controller, 2
      optional ::Ce::Nbapi::Cluster_info, :cluster, 3
    end

    class Ap_location
      required ::Ce::Nbapi::Mac_address, :ap_eth_mac, 1
      optional :bytes, :campus_id, 2
      optional :bytes, :building_id, 3
      optional :bytes, :floor_id, 4
      optional :double, :longitude, 5
      optional :double, :latitude, 6
      optional :double, :ap_x, 7
      optional :double, :ap_y, 8
    end

    class Nb_event
      optional :uint64, :seq, 1
      optional :uint32, :timestamp, 2
      optional ::Ce::Nbapi::Nb_event::Event_operation, :op, 3
      optional :uint64, :topic_seq, 4
      optional :bytes, :source_id, 5
      optional ::Ce::Nbapi::Nb_event::License_info, :lic_info, 6, :default => ::Ce::Nbapi::Nb_event::License_info::Hb_Dhak
      optional ::Ce::Nbapi::Location, :location, 500
      optional ::Ce::Nbapi::Presence, :presence, 501
      optional ::Ce::Nbapi::Rssi, :rssi, 502
      optional ::Ce::Nbapi::Station, :station, 503
      optional ::Ce::Nbapi::Radio, :radio, 505
      optional ::Ce::Nbapi::Destination, :destination, 507
      optional ::Ce::Nbapi::Application, :application, 509
      optional ::Ce::Nbapi::Visibility_rec, :visibility_rec, 510
      optional ::Ce::Nbapi::Campus, :campus, 511
      optional ::Ce::Nbapi::Building, :building, 512
      optional ::Ce::Nbapi::Floor, :floor, 513
      optional ::Ce::Nbapi::Access_point, :access_point, 514
      optional ::Ce::Nbapi::Virtual_access_point, :virtual_access_point, 515
      optional ::Ce::Nbapi::Geofence, :geofence, 516
      optional ::Ce::Nbapi::Geofence_notify, :geofence_notify, 517
      optional ::Ce::Nbapi::Stats_radio, :stats_radio, 518
      optional ::Ce::Nbapi::Stats_vap, :stats_vap, 519
      optional ::Ce::Nbapi::Stats_station, :stats_station, 520
      optional ::Ce::Nbapi::Ap_neighbor_list, :ap_neighbor_list, 521
      optional ::Ce::Nbapi::Utilization_stats_radio, :utilization_stats_radio, 522
      optional ::Ce::Nbapi::Sta_rssi, :sta_rssi, 523
      optional ::Ce::Nbapi::Ap_rssi, :ap_rssi, 524
      optional ::Ce::Nbapi::Proximity, :proximity, 525
      optional ::Ce::Nbapi::Webcc_category, :webcc_category, 526
      optional ::Ce::Nbapi::Webcc_info, :webcc_info, 527
      optional ::Ce::Nbapi::Security_message, :security_message, 528
      optional ::Ce::Nbapi::Spectrum_info, :spectrum_info, 529
      optional ::Ce::Nbapi::State_station, :state_station, 530
      optional ::Ce::Nbapi::Controller_info, :controller, 531
      optional ::Ce::Nbapi::Cluster_info, :cluster, 532
      optional ::Ce::Nbapi::Uplink_bandwidth, :uplink_bandwidth, 533
      optional ::Ce::Nbapi::Iap_client_url, :iapClientURL, 544
      optional ::Ce::Nbapi::Rogue_info, :rogue_info, 545
      optional ::Ce::Nbapi::Air_monitor_info, :air_mon_info, 546
      optional ::Ce::Nbapi::Ap_location, :ap_location, 547
      optional ::Ce::Nbapi::State_access_point, :state_access_point, 548
      optional ::Ce::Nbapi::Stats_modem, :stats_modem, 549
      optional ::Ce::Nbapi::Uplink_info, :uplink_info, 550
      optional ::Ce::Nbapi::Stats_uplink, :stats_uplink, 551
      optional ::Ce::Nbapi::Wan_comp_uplink, :wan_comp_uplink, 552
      optional ::Ce::Nbapi::Stats_ip_probe_uplink, :stats_ip_probe_uplink, 553
      optional ::Ce::Nbapi::Summary_webcat_iap, :summary_webcat, 554
      optional ::Ce::Nbapi::Summary_appid_iap, :summary_appid, 555
      optional ::Ce::Nbapi::Summary_webrep_iap, :summary_webrep, 556
      optional ::Ce::Nbapi::Stats_role_iap, :stats_role, 557
      optional ::Ce::Nbapi::Stats_vlan_iap, :stats_vlan, 558
      optional ::Ce::Nbapi::Stats_ssid_iap, :stats_ssid, 559
    end

    class Query_response
      class Location_result
        required ::Ce::Nbapi::Location, :msg, 11
        optional :uint32, :ts, 12
      end

      class Presence_result
        required ::Ce::Nbapi::Presence, :msg, 21
        optional :uint32, :ts, 22
      end

      class Rssi_result
        required ::Ce::Nbapi::Rssi, :msg, 31
        optional :uint32, :ts, 32
      end

      class Station_result
        required ::Ce::Nbapi::Station, :msg, 41
        optional :uint32, :ts, 42
      end

      class Radio_result
        required ::Ce::Nbapi::Radio, :msg, 51
        optional :uint32, :ts, 52
      end

      class Destination_result
        required ::Ce::Nbapi::Destination, :msg, 61
        optional :uint32, :ts, 62
      end

      class Application_result
        required ::Ce::Nbapi::Application, :msg, 71
        optional :uint32, :ts, 72
      end

      class Visibility_rec_result
        required ::Ce::Nbapi::Visibility_rec, :msg, 81
        optional :uint32, :ts, 82
      end

      class Campus_result
        required ::Ce::Nbapi::Campus, :msg, 91
        optional :uint32, :ts, 92
      end

      class Building_result
        required ::Ce::Nbapi::Building, :msg, 101
        optional :uint32, :ts, 102
      end

      class Floor_result
        required ::Ce::Nbapi::Floor, :msg, 111
        optional :uint32, :ts, 112
      end

      class Access_point_result
        required ::Ce::Nbapi::Access_point, :msg, 121
        optional :uint32, :ts, 122
      end

      class Virtual_access_point_result
        required ::Ce::Nbapi::Virtual_access_point, :msg, 131
        optional :uint32, :ts, 132
      end

      class Geofence_result
        required ::Ce::Nbapi::Geofence, :msg, 141
        optional :uint32, :ts, 142
      end

      class Proximity_result
        required ::Ce::Nbapi::Proximity, :msg, 152
        optional :uint32, :ts, 153
      end

      class WebCCCategory_result
        required ::Ce::Nbapi::Webcc_category, :msg, 161
        optional :uint32, :ts, 162
      end

      class Info_result
        required ::Ce::Nbapi::Info, :msg, 171
        optional :uint32, :ts, 172
      end

      class Topology_result
        required ::Ce::Nbapi::Topology, :msg, 181
        optional :uint32, :ts, 182
      end

      class Controller_result
        required ::Ce::Nbapi::Controller_info, :msg, 191
        optional :uint32, :ts, 192
      end

      class Cluster_result
        required ::Ce::Nbapi::Cluster_info, :msg, 201
        optional :uint32, :ts, 202
      end

      class Access_point_location_result
        required ::Ce::Nbapi::Ap_location, :msg, 211
        optional :uint32, :ts, 212
      end

      repeated ::Ce::Nbapi::Query_response::Location_result, :location_result, 10
      repeated ::Ce::Nbapi::Query_response::Presence_result, :presence_result, 20
      repeated ::Ce::Nbapi::Query_response::Rssi_result, :rssi_result, 30
      repeated ::Ce::Nbapi::Query_response::Station_result, :station_result, 40
      repeated ::Ce::Nbapi::Query_response::Radio_result, :radio_result, 50
      repeated ::Ce::Nbapi::Query_response::Destination_result, :destination_result, 60
      repeated ::Ce::Nbapi::Query_response::Application_result, :application_result, 70
      repeated ::Ce::Nbapi::Query_response::Visibility_rec_result, :visibility_rec_result, 80
      repeated ::Ce::Nbapi::Query_response::Campus_result, :campus_result, 90
      repeated ::Ce::Nbapi::Query_response::Building_result, :building_result, 100
      repeated ::Ce::Nbapi::Query_response::Floor_result, :floor_result, 110
      repeated ::Ce::Nbapi::Query_response::Access_point_result, :access_point_result, 120
      repeated ::Ce::Nbapi::Query_response::Virtual_access_point_result, :virtual_access_point_result, 130
      repeated ::Ce::Nbapi::Query_response::Geofence_result, :geofence_result, 140
      repeated ::Ce::Nbapi::Query_response::Proximity_result, :proximity_result, 150
      repeated ::Ce::Nbapi::Query_response::WebCCCategory_result, :webcccategory_result, 160
      optional ::Ce::Nbapi::Query_response::Info_result, :info_result, 170
      repeated ::Ce::Nbapi::Query_response::Topology_result, :topology_result, 180
      repeated ::Ce::Nbapi::Query_response::Controller_result, :controller_result, 190
      repeated ::Ce::Nbapi::Query_response::Cluster_result, :cluster_result, 200
      repeated ::Ce::Nbapi::Query_response::Access_point_location_result, :access_point_location_result, 210
    end

    class Iap_client_url
      optional ::Ce::Nbapi::Iap_message_info, :info, 1
      optional :uint64, :timestamp, 2
      optional ::Ce::Nbapi::Mac_address, :ap_mac, 3
      optional ::Ce::Nbapi::Url_detail_record, :url_record, 4
      optional :string, :ap_host_name, 5
    end

    class Url_detail_record
      optional ::Ce::Nbapi::Ip_address, :client_ip, 1
      optional ::Ce::Nbapi::Ip_address, :dest_ip, 2
      optional :bytes, :url, 3
      optional :uint32, :hit_count, 4
      optional ::Ce::Nbapi::Mac_address, :client_mac, 5
      optional ::Ce::Nbapi::Url_detail_record::Url_http_method, :http_method, 6
      optional :uint64, :last_hit_timestamp, 7
    end

    class Iap_message_info
      optional :uint32, :version, 1
      optional :uint64, :sequence, 3
      optional :bytes, :guid, 4
      optional :string, :oem_tag, 5
    end

    class Air_monitor_info
      optional ::Ce::Nbapi::Mac_address, :monitor_mac, 1
      optional :bytes, :essid, 2
      optional :uint32, :monitor_channel, 3
      optional :uint32, :is_ap, 4
      optional :uint32, :classification_type, 5
      optional :uint32, :phy_type, 6
      optional :uint32, :ht_type, 7
      optional ::Ce::Nbapi::Mac_address, :heard_mac, 8
      optional ::Ce::Nbapi::Mac_address, :bssid, 9
      optional :uint32, :encr_type, 10
      optional :uint32, :encr_cipher, 11
      optional :uint32, :auth_alg, 12
      optional ::Ce::Nbapi::Air_monitor_rogue_info, :am_rogue, 13
    end

    class Air_monitor_rogue_info
      optional :uint32, :match_type, 1
      optional ::Ce::Nbapi::Mac_address, :match_mac, 2
      optional ::Ce::Nbapi::Ip_address, :match_ip, 3
      optional :string, :monitor_name, 4
      optional :uint32, :nat_match_type, 5
    end

  end

end

