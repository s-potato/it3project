json.extract! film, :id, :title, :description, :genre, :episode, :rate, :created_at, :updated_at
json.url film_url(film, format: :json)
