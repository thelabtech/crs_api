json.registrants @profiles do |json, profile|
  person = profile.person
  json.id profile.id
  json.first_name person.first_name
  json.last_name person.last_name
  json.email person.email
  json.primary_phone person.current_phone
end
