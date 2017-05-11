class Order < ApplicationRecord
  belongs_to :user
  belongs_to :table
  #has_and_belongs_to_many :plates
  has_many :charges
  has_many :plates, through: :charges

  validates :user_id,:table_id,:presence=>true, :numericality=>true

  before_destroy :removeAllCharges

  def checkDependences
    return self.charges.count == 0
  end

  def closeOrder
    self.table.changeStatusTable(true)
    self.paid = true
    self.payment_time = Time.now
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

  def removeAllCharges
    if self.kitchen
      self.charges.update(cancelled:true,observations:"Cancelled")
      self.cancelled = true
      self.charges.each  do |cl|
        cl.charges_lines.destroy_all
      end
    else
        self.charges.each  do |cl|
          cl.charges_lines.destroy_all
        end
        self.charges.destroy_all
    end
    self.save
  end
end
