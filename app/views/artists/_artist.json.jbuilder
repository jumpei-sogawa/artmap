json.extract! artist, :id, :name, :country, :birth, :death, :created_at, :updated_at
json.url artist_url(artist, format: :json)
