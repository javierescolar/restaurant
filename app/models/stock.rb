class Stock < ApplicationRecord
  belongs_to :product

  validates :product_id, :quantity, :unit_measure, :expiration_date, presence:true
  validates :quantity,:numericality => true

end
