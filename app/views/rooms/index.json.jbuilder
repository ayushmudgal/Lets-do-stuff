json.array!(@rooms) do |room|
  json.extract! room, :id, :name, :location
  json.url room_url(room, format: :json)
end
