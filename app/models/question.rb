class Question < ApplicationRecord
  belongs_to :product

  has_many :answers

  def checkDependences
    return self.answers.count == 0 
  end
end
