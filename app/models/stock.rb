class Stock < ApplicationRecord
  belongs_to :product

  validates :product_id, :quantity, :expiration_date, presence:true
  validates :quantity,:numericality => true

end
