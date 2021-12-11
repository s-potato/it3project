class Film < ApplicationRecord
    has_one_attached :thumbnail
    has_one_attached :trailer

    has_many :film_review, -> { order "created_at DESC"}
end
