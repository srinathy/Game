class Product < ActiveRecord::Base
  require_dependency "search"
  has_many :items
  searches_on :name, :description
  CERTIFICATES = ['18', '16+', '15', '12+', '7+', '3+']
  
  validates :name, presence: true 
  validates :price, presence: true 
  validates :description,  presence: true, length:{maximum:240}
  validates :image, presence: true
  validates :certificate, presence: true
  validates :releasedate, presence: true
  validates :quantity, presence: true
end
