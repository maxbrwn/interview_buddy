class Question < ApplicationRecord
  has_many :interview_questions, dependent: :destroy
  has_many :interviews, through: :interview_questions
  has_many :bookmarks, dependent: :destroy
  has_many :users, through: :bookmarks

  def bookmarked?(user)
    bookmarks.find_by(user: user)
  end
end
