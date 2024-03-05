class Question < ApplicationRecord
  has_many :interview_questions, dependent: :destroy
  has_many :interviews, through: :interview_questions

end
