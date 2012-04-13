class Crs2Profile < ActiveRecord::Base
  set_table_name 'crs2_profile'
	set_inheritance_column 'fake'
  belongs_to :crs2_person, class_name: 'Crs2Person', foreign_key: :crs_person_id
  belongs_to :ministry_person, class_name: 'Person', foreign_key: :ministry_person_id
  belongs_to :crs2_user, class_name: 'Crs2User', foreign_key: :user_id
  has_many :crs2_registrants, class_name: 'Crs2Registrant', foreign_key: :profile_id

  def person
    ministry_person || crs2_person
  end
end
