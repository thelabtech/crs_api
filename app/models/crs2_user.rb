class Crs2User < ActiveRecord::Base
  set_table_name 'crs2_user'
  has_many :crs2_conferences, class_name: 'Crs2Conference', foreign_key: :creator_id
  has_one :crs2_profile, class_name: 'Crs2Profile', foreign_key: :user_id
  has_many :crs2_registrants, class_name: 'Crs2Registrant', foreign_key: :cancelled_by_id
  has_many :crs2_registrations, class_name: 'Crs2Registration', foreign_key: :creator_id
  has_many :crs2_registration_cancellers, class_name: 'Crs2Registration', foreign_key: :cancelled_by_id
  has_many :crs2_transactions, class_name: 'Crs2Transaction', foreign_key: :verified_by_id
  has_many :crs2_user_roles, class_name: 'Crs2UserRole', foreign_key: :user_id


	def merge(other)
    reload
    other.reload

		other.crs2_conferences.each { |ua| ua.update_attribute(:creator_id, id) }
		other.crs2_user_roles.each { |ua| ua.update_attribute(:user_id, id) }
   	#other.crs2_registrants.each { |ua| ua.update_attribute(:cancelled_by_id, id) }

		Crs2Registration.where(["creator_id = ? or cancelled_by_id = ?", other.id, other.id]).each do |ua|
			ua.update_attribute(:creator_id, id) if ua.creator_id == other.id
			ua.update_attribute(:cancelled_by_id, id) if ua.cancelled_by_id == other.id	
		end

		other.crs2_transactions.each { |ua| ua.update_attribute(:verified_by_id, id) }
		
		save
	end

end