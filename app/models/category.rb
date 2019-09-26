class Category < ApplicationRecord
  has_many :touristareas, dependent: :destroy
end
