class CreateStocks < ActiveRecord::Migration[5.0]
  def change
    create_table :stocks do |t|
      t.references :product, foreign_key: true
      t.float :quantity
      t.string :unit_measure
      t.date :expiration_date

      t.timestamps
    end
  end
end
