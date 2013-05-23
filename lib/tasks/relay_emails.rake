namespace :relay do
  task emails: :environment do
    staff = MinistryStaff.find_by_sql("select id, accountNo, firstName, preferredName, lastName, ministry, `primaryEmpLocCity`, `primaryEmpLocCountry`, `primaryEmpLocState`, deptId, jobTitle, deptName, statusDescr, relay_email from ministry_staff where `removedFromPeopleSoft` = 'N' and updated_at > '#{2.days.ago.to_s(:db)}'")
    Gibbon.timeout = 6000
    gb = Gibbon.new(Rails.configuration.mailchimp_key)
    batch = []
    staff.each do |s|
      link = IdentityLinker::Linker.find_linked_identity('emplid', s.accountNo, 'username')
      if link
        username = link[:identity][:id_value]
        if username && username != s.relay_email
          # update mailchimp
          vars = { :EMAIL => s.relay_email, :FNAME => s.first_or_preferred,
                   :LNAME => s.lastName, MMERGE7: s.ministry, MMERGE9: s.deptId, MMERGE10: s.deptName,
                   MMERGE4: s.full_name, MMERGE3: s.person.try(:region)}
          if s.ministry == 'Campus Ministry'
            vars[:GROUPINGS] = [{id: Rails.configuration.mailchimp_uscm_grouping, groups: 'All USCM Staff'}]
          end

          if s.relay_email.present?
            # They changed their email address
            gb.list_update_member(id: Rails.configuration.mailchimp_list, email_address: s.relay_email, merge_vars: vars)
          end

          batch << vars

          s.update_column(:relay_email, username)
        end
      end
    end
    gb.list_batch_subscribe(id: Rails.configuration.mailchimp_list, batch: batch, update_existing: true, double_optin: false,
                            send_welcome: false, replace_interests: false)
  end
end

