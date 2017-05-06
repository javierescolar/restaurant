class Charge < ApplicationRecord
  belongs_to :order
  belongs_to :plate
  has_many :charges_lines

  def preparedDishYesNo
    self.prepared = (self.prepared) ? false : true
    self.save
  end
end
