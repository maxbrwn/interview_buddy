class AnswersController < ApplicationController
  def show
    @answer_feedback
  end

  def create
    @answer = Answer.new(answer_params)
    @answer.interview_question = InterviewQuestion.find(params[:interview_question_id])
    @interview = @answer.interview_question.interview

    if @answer.save
      @answer.feedback
      if @interview.answers.count < @interview.number_of_questions
        redirect_to interview_path(@answer.interview_question.interview)
      else
        redirect_to feedback_interview_path(@interview)
      end
    else
      if @interview.answers.count < @interview.number_of_questions
        @interview_questions = @interview.interview_questions
        render 'interviews/show', status: :unprocessable_entity
      else
        redirect_to feedback_interview_path(@interview)
      end
    end
  end

  def skip_question
    @answer = Answer.new(content: "I don't know")
    @answer.interview_question = InterviewQuestion.find(params[:id])
    @interview = @answer.interview_question.interview
    if @answer.save
      @answer.feedback
      if @interview.answers.count < @interview.number_of_questions
        redirect_to interview_path(@answer.interview_question.interview)
      else
        redirect_to feedback_interview_path(@interview)
      end
    else
      redirect_to interview_path(@answer.interview_question.interview)
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:content)
  end
end
