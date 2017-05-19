class DishesProduct < ApplicationRecord
  belongs_to :plate
  belongs_to :product
  
end
