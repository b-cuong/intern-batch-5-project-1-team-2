class User < ApplicationRecord
  has_many :ratings, dependent: :destroy
  has_many :tourist_areas, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
end
