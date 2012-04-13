class Crs2RegistrantType < ActiveRecord::Base
  set_table_name 'crs2_registrant_type'
  has_many :crs2_additional_expenses_items, class_name: 'Crs2AdditionalExpensesItem'
  has_many :crs2_custom_questions_items, class_name: 'Crs2CustomQuestionsItem'
  has_many :crs2_profile_questions, class_name: 'Crs2ProfileQuestion'
  has_many :crs2_registrants, class_name: 'Crs2Registrant', foreign_key: :registrant_type_id
  belongs_to :crs2_conference, class_name: 'Crs2Conference', foreign_key: :conference_id
end
