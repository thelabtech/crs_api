class Person < ActiveRecord::Base
  self.table_name = 'ministry_person'
  self.primary_key = 'personID'

  has_many :addresses, foreign_key: 'fk_personID'
  has_one :current_address, class_name: 'Address', foreign_key: 'fk_personID', conditions: {'ministry_newaddress.addressType' => 'current'}
  has_one :crs2_profile, foreign_key: 'ministry_person_id'
  belongs_to :user, foreign_key: 'fk_ssmUserId'

  def first_name
    firstName
  end

  def last_name
    lastName
  end

  def email
    current_address.try(:email)
  end

  def current_phone
    if current_address
      return current_address.cellPhone if current_address.cellPhone.present?
      return current_address.homePhone if current_address.homePhone.present?
      return current_address.homePhone if current_address.homePhone.present?
    end
  end
end
