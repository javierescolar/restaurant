class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table :tables do |t|
      t.integer :number
      t.integer :capacity
      t.boolean :free, :default => true


      t.timestamps
    end
  end
end
