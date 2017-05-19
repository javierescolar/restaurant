class Charge < ApplicationRecord
  belongs_to :order
  belongs_to :plate
  has_many :charges_lines

  def preparedDishYesNo
    self.prepared = (self.prepared) ? false : true
    
    self.plate.dishes_products.each  do |product|
      stock_selection = Stock.where('quantity >= ?',product.quantity).order('expiration_date').first
      stock_selection.updateQuantityStock(product.quantity, self.prepared)
    end
    
    self.save
  end

  def cancelledCharge
    self.cancelled = true
    self.observations = "Cancelled"
    self.save
  end
end
