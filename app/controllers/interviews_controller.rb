class InterviewsController < ApplicationController
  before_action :set_interview, only: [:show]
  skip_before_action :authenticate_user!

  def index
  end

  def show
    @answer = Answer.new
    @interview_questions = @interview.interview_questions
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
      @interview.number_of_questions.times do
        @interview_question = InterviewQuestion.new(interview_id: @interview.id, question_id: @questions.pop.id)
        @interview_question.save
      end
      redirect_to interview_path(@interview)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_interview
    @interview = Interview.find(params[:id])
  end

  def params_interview
    params.require(:interview).permit(:role, :language, :number_of_questions)
  end

end
