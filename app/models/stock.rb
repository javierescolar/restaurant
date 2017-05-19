class Stock < ApplicationRecord
  belongs_to :product
  
  
  validates :product_id, :quantity, :unit_measure, :expiration_date, presence:true
  validates :quantity,:numericality => true
  
  def updateQuantityStock(quantity, type_operation)
    self.quantity = (type_operation) ? self.quantity - quantity : self.quantity + quantity;
    self.save
  end

end
