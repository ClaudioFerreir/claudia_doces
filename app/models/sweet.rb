class Sweet < ApplicationRecord
  belongs_to :subject
  has_one_attached :image
  
  # kaminari pagination
  paginates_per 10

  def self.search(term, page)
    Sweet.where("lower(name) LIKE ?", "%#{term.downcase}%")
         .order(:name)
         .page(page)
  end
end
