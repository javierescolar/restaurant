class OrderPlate < ApplicationRecord
  self.table_name = "orders_plates"
    belongs_to :order
    belongs_to :plate
end
