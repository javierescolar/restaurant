class Table < ApplicationRecord
  

  validates :number,:capacity, :presence => true,:numericality => true

  def changeStatusTable(status)
      self.free = status
      self.save
  end
end
