class Product < ApplicationRecord
  self.table_name = 'l_products'
  validates :name, presence: true
  validates :price, presence: true
end
