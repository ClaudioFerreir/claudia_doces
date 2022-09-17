class Sweet < ApplicationRecord
  belongs_to :subject
  has_one_attached :image
  
  # kaminari pagination
  paginates_per 5
end
