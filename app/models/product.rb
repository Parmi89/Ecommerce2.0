class Product < ApplicationRecord
  include PgSearch::Model
  has_rich_text :description
  
  pg_search_scope :search_full_text,
  against: {
    name: 'A',
    description: 'B'
  },
  using: {
    tsearch: { prefix: true }
  }

  has_many_attached :photos
  belongs_to :category
  belongs_to :admin
 
end
