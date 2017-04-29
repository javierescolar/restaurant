class Category < ApplicationRecord
  has_many :plates
  
  validates :name, :presence => true

  def checkDependences
    return self.plates.count == 0
  end
end
