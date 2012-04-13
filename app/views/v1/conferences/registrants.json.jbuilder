json.array!(@profiles) do |json, profile|
  json.first_name profile.person.first_name
  json.last_name profile.person.last_name
end
