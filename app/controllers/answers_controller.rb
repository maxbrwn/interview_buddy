class AnswersController < ApplicationController
  def create

    @answer = Answer.new(answer_params)
    raise

    @answer.interview_question = InterviewQuestion.find(params[:interview_question_id])
    raise
    if @answer.save
      redirect_to interview_path(@answer.interview_question.interview)
    else
      render 'interviews/show'
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content, :interview_question_id)
  end
end
