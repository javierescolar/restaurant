class Table < ApplicationRecord
  has_many :orders

  validates :number,:capacity, :presence => true,:numericality => true

  def checkDependences
    return self.orders.count == 0
  end

  def changeStatusTable(status)
      self.free = status
      self.save
  end
end
