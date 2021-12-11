class Film < ApplicationRecord
    has_one_attached :thumbnail
    has_one_attached :trailer

    has_many :film_review, -> { order "created_at DESC"}
    validates :thumbnail, presence: true
    validates :episode, presence: true, numericality: { only_integer: true , greater_than_or_equal_to: 1, less_than_or_equal_to:10000 }
    validates :title, presence: true
    validates :genre, presence: true
end
