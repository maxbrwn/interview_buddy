class Interview < ApplicationRecord
  belongs_to :user
  has_many :interview_questions, dependent: :destroy
  has_many :questions, through: :interview_questions
end
