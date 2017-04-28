class CreateDishesProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :dishes_products do |t|
      t.references :plate, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
