class Crs2ModuleUsage < ActiveRecord::Base
  set_table_name 'crs2_module_usage'
  belongs_to :crs2_conference, class_name: 'Crs2Conference', foreign_key: :conference_id
end
