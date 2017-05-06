class ChargesLine < ApplicationRecord
  belongs_to :charge
  belongs_to :product
  belongs_to :question
  belongs_to :answer
end
