class InterviewQuestion < ApplicationRecord
  belongs_to :interview
  belongs_to :question
  has_many :answers, dependent: :destroy
end
