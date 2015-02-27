json.array!(@songtopics) do |songtopic|
  json.extract! songtopic, :id, :name, :album
  json.url songtopic_url(songtopic, format: :json)
end
