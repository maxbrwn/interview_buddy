class AnswersController < ApplicationController
  def show
    @answer_feedback
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.interview_question = InterviewQuestion.find(params[:interview_question_id])
    interview = @answer.interview_question.interview
    if @answer.save
      @answer.feedback
      session[:current_index] += 1 unless session[:current_index] >= interview.interview_questions.size - 1

      redirect_to interview_path(@answer.interview_question.interview)
    else
      render 'interviews/show', status: :unprocessable_entity
    end
  end

    def skip_question
      @answer = Answer.new(content: "I don't know")
      @answer.interview_question = InterviewQuestion.find(params[:id])
      interview = @answer.interview_question.interview
      if @answer.save
        @answer.feedback
        session[:current_index] += 1 unless session[:current_index] >= interview.interview_questions.size - 1
        redirect_to interview_path(@answer.interview_question.interview)
      end
    end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end
