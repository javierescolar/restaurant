class Charge < ApplicationRecord
  belongs_to :order
  belongs_to :plate
  has_many :charges_lines

  def preparedDishYesNo
    if (self.prepared)
      self.prepared = false
    else
      self.prepared = true
    end
    self.save
  end

  def cancelledCharge
    self.cancelled = true
    self.observations = "Cancelled"
    self.save
  end
end
