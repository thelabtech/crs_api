class Crs2ExpenseSelection < ActiveRecord::Base
  set_table_name 'crs2_expense_selection'
  belongs_to :crs2_additional_expenses_item, class_name: 'Crs2AdditionalExpensesItem', foreign_key: :expense_usage_id
  belongs_to :crs2_registrant, class_name: 'Crs2Registrant', foreign_key: :registrant_id
  has_many :crs2_transactions, class_name: 'Crs2Transaction'
end
