class Film < ApplicationRecord
    has_one_attached :thumbnail
    has_one_attached :trailer
end
