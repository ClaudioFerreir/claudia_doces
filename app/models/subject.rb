class Subject < ApplicationRecord
  has_many :sweets

  # kaminari pagination
  paginates_per 5
end
