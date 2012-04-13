class Crs2UrlBase < ActiveRecord::Base
  set_table_name 'crs2_url_base'
  has_many :crs2_conferences, class_name: 'Crs2Conference'
  has_many :crs2_configurations, class_name: 'Crs2Configuration'
end
