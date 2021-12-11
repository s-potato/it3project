json.extract! film_review, :id, :user_id, :film_id, :review, :rate, :created_at, :updated_at
json.url film_review_url(film_review, format: :json)
