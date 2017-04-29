class Product < ApplicationRecord
  has_many :dishes_products
  has_many :plates, through: :dishes_products
end
