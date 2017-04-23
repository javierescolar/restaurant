class Order < ApplicationRecord
  belongs_to :user
  belongs_to :table
  has_and_belongs_to_many :plates

  validates :user_id,:table_id,:presence=>true, :numericality=>true
  def closeOrder
    self.table.changeStatusTable(true)
    self.paid = true
    self.save
  end

  def addPlate(plate_id)
    @plate = Plate.find(plate_id)
    self.amount += @plate.price.to_f
    OrderPlate.new(order_id:self.id,plate_id: @plate.id,prepared:false).save
    self.save
  end

  def removePlate(plate_id)
    @plate = Plate.find(plate_id)
    self.amount -= @plate.price.to_f
    OrderPlate.find_by(order_id:self.id,plate_id: @plate.id).destroy.save
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
