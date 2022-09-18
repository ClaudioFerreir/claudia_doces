class Sweet < ApplicationRecord
  belongs_to :subject
  has_one_attached :image
  
  # kaminari pagination
  paginates_per 10
end
