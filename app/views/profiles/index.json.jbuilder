json.array!(@profiles) do |profile|
  json.extract! profile, :id, :name, :email, :pool, :location, :contact, :about_me
  json.url profile_url(profile, format: :json)
end
