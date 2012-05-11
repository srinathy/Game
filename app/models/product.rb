class Product < ActiveRecord::Base
  has_many :items
  CERTIFICATES = ['18', '16+', '15', '12+', '7+', '3+']
end
