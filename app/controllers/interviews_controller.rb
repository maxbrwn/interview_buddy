class InterviewsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_interview, only: [:show, :next_question, :feedback]

  def index
  end

  def show
    @answer = Answer.new
    @interview_questions = @interview.interview_questions
    if @interview.questions.count == @interview.answers.count
      redirect_to feedback_interview_path(@interview)
    end
  end

  def new
    @interview = Interview.new
  end

  def create
    @user_id = current_user.id
    @interview = Interview.new(params_interview)
    @interview.user_id = @user_id
    @questions = Question.all.sample(10).uniq
    if @interview.save
      @questions.each do |question|
        @interview_question = InterviewQuestion.new(interview: @interview, question: question)
        @interview_question.save
      end

      redirect_to interview_path(@interview)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def next_question
    redirect_to interview_path(@interview)
  end

  def feedback
    @answer_array = []
    @question_array = []
    @answer_feedback_array = []
    @interview.overall_feedback
    @questions = @interview.questions.pluck(:content)
    @answers = @interview.answers.pluck(:content)
    @answers_feedback = @interview.answers.pluck(:answer_feedback)
    @answers.each do |answer|
      @answer_array << answer
    end
    @questions.each do |question|
      @question_array << question
    end
    @answers_feedback.each do |answer|
      @answer_feedback_array << answer
    end
  end

  def my_profile
    # get access to all the interviews of the current user
    @user_interviews = current_user.interviews
    @bookmarks = Bookmark.where(user: current_user)
    # get access to the overall feedback of each interview
  end

  private

  def set_interview
    @interview = Interview.find(params[:id])
  end

  def params_interview
    params.require(:interview).permit(:role, :language, :number_of_questions)
  end
end
