class OrderPlate < ApplicationRecord
  self.table_name = "orders_plates"
    belongs_to :order
    belongs_to :plate


    def preparedDishYesNo
      self.prepared = (self.prepared) ? false : true
      self.save
    end
end
