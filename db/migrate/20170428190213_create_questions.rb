class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.references :product, foreign_key: true
      t.string :text_question

      t.timestamps
    end
  end
end
