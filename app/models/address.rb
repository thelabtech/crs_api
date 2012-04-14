class Address < ActiveRecord::Base
  set_table_name 'ministry_newaddress'
  belongs_to :person, foreign_key: 'fk_personID'
end
