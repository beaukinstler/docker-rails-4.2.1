json.extract! song, :id, :title, :length, :published_by, :created_at, :updated_at
json.url song_url(song, format: :json)
