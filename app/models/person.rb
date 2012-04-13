class Person < ActiveRecord::Base
  set_table_name 'ministry_person'
  def first_name
    firstName
  end

  def last_name
    lastName
  end
end
