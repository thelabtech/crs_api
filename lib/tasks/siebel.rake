namespace :siebel do
  task link: :environment do
    Person.includes(:user).where("simplesecuritymanager_user.globallyUniqueID is not null and siebel_contact_id is null").select(:globallyUniqueID).find_each do |person|
      identity = IdentityLinker::Linker.find_linked_identity('ssoguid', person.user.globallyUniqueID, 'siebelcontactid')
      if identity
        person.update_column(:siebel_contact_id, identity[:identity][:id_value])
      end
    end
  end
end
