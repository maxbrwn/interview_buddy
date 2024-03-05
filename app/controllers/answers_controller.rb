class AnswersController < ApplicationController
  def create
    @answer = Answer.new(answer_params)
    @answer.interview_question = InterviewQuestion.find(params[:interview_question_id])
    if @answer.save
      redirect_to interview_path(@answer.interview_question.interview)
    else
      render 'interviews/show', status: :unprocessable_entity
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end
