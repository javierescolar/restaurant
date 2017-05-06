class ChargesLines < ActiveRecord::Migration[5.0]
  def change
    create_table :charges_lines do |t|
      t.references :charge, foreign_key: true
      t.references :product, foreign_key: true
      t.references :question, foreign_key: true
      t.references :answer, foreign_key: true
      t.timestamps
    end
  end
end
