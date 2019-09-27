class TouristArea < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :reviews, dependent: :destroy
  has_many :ratings, dependent: :destroy
end
