json.array!(@locations) do |location|
  json.extract! location, :id, :adress, :latitude, :longitude
  json.url location_url(location, format: :json)
end
