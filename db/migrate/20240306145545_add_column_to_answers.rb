class AddColumnToAnswers < ActiveRecord::Migration[7.1]
  def change
    add_column :answers, :answer_feedback, :text
  end
end
