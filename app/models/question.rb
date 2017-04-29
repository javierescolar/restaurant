class Question < ApplicationRecord
  belongs_to :product

  has_many :answers
end
