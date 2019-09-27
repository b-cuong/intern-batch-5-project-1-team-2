class Category < ApplicationRecord
  has_many :tourist_areas, dependent: :destroy
end
