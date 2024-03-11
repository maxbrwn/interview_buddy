class InterviewsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_interview, only: [:show, :next_question, :feedback]

  def index
  end

  def show
    @answer = Answer.new
    @interview_questions = @interview.interview_questions
    session[:current_index] ||= 0
  end

  def new
    @interview = Interview.new
  end

  def create
    @user_id = current_user.id
    @interview = Interview.new(params_interview)
    @interview.user_id = @user_id
    number_of_questions = @interview.number_of_questions
    @questions = Question.all.sample(number_of_questions).uniq
    if @interview.save
      @interview.number_of_questions.times do
        @interview_question = InterviewQuestion.new(interview_id: @interview.id, question_id: @questions.pop.id)
        @interview_question.save
      end
      redirect_to interview_path(@interview)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def next_question
    session[:current_index] += 1 if session[:current_index].present?
    redirect_to interview_path(@interview)
  end

  def feedback
    session[:current_index]
    @answers = @interview.answers
    @questions = @interview.questions
    @answers_feedback = @answers.pluck(:answer_feedback)
    @interview.overall_feedback
    # @json = JSON.parse(@interview.feedback)
    #@questions = @interview.questions.pluck(:content)
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
