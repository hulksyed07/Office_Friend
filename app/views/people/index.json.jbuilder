json.array!(@people) do |person|
  json.extract! person, :id, :name, :email, :pool, :location, :contact, :about_me
  json.url person_url(person, format: :json)
end
