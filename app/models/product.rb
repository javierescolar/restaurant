class Product < ApplicationRecord

  has_many :dishes_products
  has_many :plates, through: :dishes_products
  has_many :stocks

  has_many :questions
  
  validates :name, :price, :presence => true
  validates :price, :numericality  => {only_float:true}

  def checkDependences
    return self.questions.count == 0 && self.dishes_products.count == 0 && self.stocks.count == 0
  end
end
