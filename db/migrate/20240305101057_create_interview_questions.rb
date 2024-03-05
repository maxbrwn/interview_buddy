class CreateInterviewQuestions < ActiveRecord::Migration[7.1]
  def change
    create_table :interview_questions do |t|
      t.references :interview, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true

      t.timestamps
    end
  end
end
