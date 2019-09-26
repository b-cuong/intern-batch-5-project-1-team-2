class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :tourist_area
end
