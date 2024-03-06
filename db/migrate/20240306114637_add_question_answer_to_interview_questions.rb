class AddQuestionAnswerToInterviewQuestions < ActiveRecord::Migration[7.1]
  def change
    add_column :interview_questions, :answer_feedback, :text
  end
end
