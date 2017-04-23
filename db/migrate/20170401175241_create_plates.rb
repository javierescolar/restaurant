class CreatePlates < ActiveRecord::Migration[5.0]
  def change
    create_table :plates do |t|
      t.references :category, foreign_key: true
      t.string :name
      t.text :description
      t.float :price
      t.string :photo

      t.timestamps
    end
  end
end
