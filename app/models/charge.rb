class Charge < ApplicationRecord
  belongs_to :order
  belongs_to :plate
  has_many :charges_lines

  def preparedDishYesNo
    self.prepared = (self.prepared) ? false : true
    
    product_no_repeat = 0
    self.plate.dishes_products.each  do |product|
      if product_no_repeat != product.id
        product_no_repeat = product.id
        stock_selection = Stock.where(product_id: product.id).where('quantity >= ?',product.quantity).order('expiration_date').first
        if !stock_selection.nil?
          stock_selection.updateQuantityStock(product.quantity, self.prepared)
        end
      end
    end
    
    self.save
  end

  def cancelledCharge
    self.cancelled = true
    self.observations = "Cancelled"
    self.save
  end
end
