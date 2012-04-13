class Crs2CustomStylesheet < ActiveRecord::Base
  set_table_name 'crs2_custom_stylesheet'
  belongs_to :crs2_conference, class_name: 'Crs2Conference', foreign_key: :conference_id
end
