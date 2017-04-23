class CreateOrdersPlates < ActiveRecord::Migration[5.0]
  def change
    create_table :orders_plates do |t|
      t.references :order, index: { name: 'my_index_order_on_plate' }
      t.references :plate, index: { name: 'my_index_plate_on_order' }
      t.boolean :prepared, :default => false
      t.timestamps
    end
  end
end
