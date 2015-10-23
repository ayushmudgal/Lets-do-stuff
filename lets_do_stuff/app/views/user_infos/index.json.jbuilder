json.array!(@user_infos) do |user_info|
  json.extract! user_info, :id, :name, :age, :location, :hobbies, :about_me, :string
  json.url user_info_url(user_info, format: :json)
end
