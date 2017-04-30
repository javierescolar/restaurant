class Product < ApplicationRecord
  has_many :dishes_products
  has_many :plates, through: :dishes_products

  has_many :questions

  def checkDependences
    return self.questions.count == 0 && self.dishes_products.count == 0
  end
end
