class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.references :table, foreign_key: true
      t.float :amount, :default => 0
      t.boolean :paid, :default => false

      t.timestamps
    end
  end
end
