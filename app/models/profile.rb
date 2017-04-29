class Profile < ApplicationRecord
  has_many :users
  validates :name, :presence => true

  def checkDependences
    return self.users.count == 0
  end
end
