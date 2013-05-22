staff = MinistryStaff.find_by_sql("select id, accountNo, firstName, preferredName, lastName, `primaryEmpLocCity`, `primaryEmpLocCountry`, `primaryEmpLocState`, deptId, jobTitle, deptName, statusDescr from ministry_staff where ministry = 'Campus Ministry' and `removedFromPeopleSoft` = 'N' and relay_email is null")
namespace :relay do
  task emails: :environment do
    staff = MinistryStaff.find_by_sql("select id, accountNo, firstName, preferredName, lastName, `primaryEmpLocCity`, `primaryEmpLocCountry`, `primaryEmpLocState`, deptId, jobTitle, deptName, statusDescr from ministry_staff where ministry = 'Campus Ministry' and `removedFromPeopleSoft` = 'N' and relay_email is null")
    staff.each do |s|
      username = IdentityLinker::Linker.find_linked_identity('emplid', s.accountNo, 'username')
      s.update_attribute('relay_email', username[:identity][:id_value]) if username
    end
  end
end


