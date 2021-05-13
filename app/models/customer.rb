class Customer < ApplicationRecord
  has_many :contacts, dependent: :destroy
  self.table_name = 'l_customers'
end
