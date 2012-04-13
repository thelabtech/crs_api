class Crs2Person < ActiveRecord::Base
  set_table_name 'crs2_person'
  has_many :crs2_profiles, class_name: 'Crs2Profile'
end
