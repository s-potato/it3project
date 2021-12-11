class FilmReview < ApplicationRecord
    belongs_to :user
    belongs_to :film

    validates :rate, presence: true , numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to:10 }
end
