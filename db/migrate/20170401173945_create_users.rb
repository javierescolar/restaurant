class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.references :profile , foreign_key: true
      t.string :dni
      t.string :name
      t.string :surnames
      t.date :birthdate
      t.integer :phone_1
      t.integer :phone_2
      t.string :mail
      t.string :password
      t.boolean :orders_view
      t.boolean :menu
      t.boolean :create_plate
      t.boolean :category
      t.boolean :tables
      t.boolean :orders_history
      t.boolean :products
      t.boolean :questions_answers

      t.timestamps
    end
    add_index :users, :dni, unique: true
    add_index :users, :mail, unique: true
  end
end
