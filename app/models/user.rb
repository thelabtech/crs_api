class User < ActiveRecord::Base
  self.table_name = 'simplesecuritymanager_user'
  self.primary_key = 'userID'
end
