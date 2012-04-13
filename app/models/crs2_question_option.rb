class Crs2QuestionOption < ActiveRecord::Base
  set_table_name 'crs2_question_option'
  belongs_to :crs2_question, class_name: 'Crs2Question', foreign_key: :option_question_id
end
