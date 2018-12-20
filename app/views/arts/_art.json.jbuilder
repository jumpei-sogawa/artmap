json.extract! art, :id, :artist_id, :title, :year, :image_url, :location_url, :view_url, :created_at, :updated_at
json.url art_url(art, format: :json)
