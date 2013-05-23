class MinistryStaff < ActiveRecord::Base
  self.table_name = 'ministry_staff'
  belongs_to :person

  def first_or_preferred
    preferredName.present? ? preferredName : firstName
  end

  def full_name
    [first_or_preferred, lastName].join(' ')
  end
end
