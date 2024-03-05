class CreateQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :questions do |t|
      t.text :content
      t.string :category
      t.string :language
      t.string :role

      t.timestamps
    end
  end
end
