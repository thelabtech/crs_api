class Crs2AdditionalExpensesItem < ActiveRecord::Base
  set_table_name 'crs2_additional_expenses_item'
  belongs_to :crs2_expense, class_name: 'Crs2Expense', foreign_key: :expense_id
  belongs_to :crs2_registrant_type, class_name: 'Crs2RegistrantType', foreign_key: :registrant_type_id
  has_many :crs2_expense_selections, class_name: 'Crs2ExpenseSelection'
end
