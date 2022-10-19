class Sweet < ApplicationRecord
  belongs_to :subject
  has_one_attached :image
  
  # kaminari pagination
  paginates_per 10

  # Scopes
  scope :search, ->(term, page){
    where("lower(name) LIKE ?", "%#{term.downcase}%")
    .order(:name)
    .page(page)
  }

  scope :last_sweets, ->{
    all.order('created_at DESC')
  }
end
