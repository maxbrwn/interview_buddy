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
    #to save the languages, reject the blank fields and join it in a string
    params[:interview][:language] = params[:interview][:language].reject!(&:blank?).join(", ")
    params[:interview][:role] = params[:interview][:role].reject!(&:blank?).first
    @interview = Interview.new(params_interview)
    @interview.user_id = @user_id
    number_of_questions = @interview.number_of_questions
    @questions = Question.all.sample(number_of_questions).uniq
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
