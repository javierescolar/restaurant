class Charge < ApplicationRecord
  belongs_to :order
  belongs_to :plate

  def preparedDishYesNo
    self.prepared = (self.prepared) ? false : true
    self.save
  end
end
