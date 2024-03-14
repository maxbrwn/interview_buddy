class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_many :interviews, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :questions, through: :bookmarks
  def bookmarked?(question)
    questions.include?(question)
  end
  has_many :speech_logs, dependent: :destroy
end
