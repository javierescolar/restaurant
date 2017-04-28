class Order < ApplicationRecord
  belongs_to :user
  belongs_to :table
  #has_and_belongs_to_many :plates
  has_many :charges
  has_many :plates, through: :charges

  validates :user_id,:table_id,:presence=>true, :numericality=>true

  

  def closeOrder
    self.table.changeStatusTable(true)
    self.paid = true
    self.save
  end

  def updateAmount()
    total_amount = self.plates.sum('price')
    self.amount = total_amount
    self.save
  end

  def sendKitchen
    if self.kitchen == false
      self.kitchen = true
      self.delivery_time_kitchen = Time.now
      self.save
    end
  end

end
