class Crs2Registrant < ActiveRecord::Base
  set_table_name 'crs2_registrant'
  has_many :crs2_answers, class_name: 'Crs2Answer'
  has_many :crs2_expense_selections, class_name: 'Crs2ExpenseSelection'
  belongs_to :crs2_user, class_name: 'Crs2User', foreign_key: :cancelled_by_id
  belongs_to :crs2_profile, class_name: 'Crs2Profile', foreign_key: :profile_id
  belongs_to :crs2_registrant_type, class_name: 'Crs2RegistrantType', foreign_key: :registrant_type_id
  belongs_to :crs2_registration, class_name: 'Crs2Registration', foreign_key: :registration_id
  has_many :crs2_transactions, class_name: 'Crs2Transaction'

end
