class CreateInterviews < ActiveRecord::Migration[7.1]
  def change
    create_table :interviews do |t|
      t.references :user, null: false, foreign_key: true
      t.text :feedback
      t.boolean :finished, default: false
      t.string :role
      t.integer :number_of_questions
      t.string :language

      t.timestamps
    end
  end
end
