class Crs2Registration < ActiveRecord::Base
  set_table_name 'crs2_registration'
	set_inheritance_column 'fake'
  has_many :crs2_registrants, class_name: 'Crs2Registrant'
  has_many :crs2_registrants, class_name: 'Crs2Registrant'
  belongs_to :crs2_user, class_name: 'Crs2User', foreign_key: :creator_id
  has_many :crs2_transactions, class_name: 'Crs2Transaction'


end
