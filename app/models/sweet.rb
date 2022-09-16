class Sweet < ApplicationRecord
  belongs_to :subject

  # kaminari pagination
  paginates_per 5
end
