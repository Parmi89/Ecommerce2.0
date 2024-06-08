class Product < ApplicationRecord
  include PgSearch::Model
  
  pg_search_scope :search_full_text,
  against: {
    name: 'A',
    description: 'B'
  },
  using: {
    tsearch: { prefix: true }
  }

  has_one_attached :photo  
  belongs_to :category
 
end
