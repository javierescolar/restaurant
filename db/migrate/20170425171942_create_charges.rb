class CreateCharges < ActiveRecord::Migration[5.0]
  def change
    create_table :charges do |t|
      t.references :order, foreign_key: true
      t.references :plate, foreign_key: true
      t.boolean :prepared, :default => false
      t.boolean :special, :default => false
      t.text :observations
      t.timestamps
    end
  end
end
