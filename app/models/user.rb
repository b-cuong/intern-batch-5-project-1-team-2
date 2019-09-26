class User < ApplicationRecord
  has_many :ratings, dependent: :destroy
  has_many :touristareas, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
end
