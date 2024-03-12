class BookmarksController < ApplicationController
  def create
    @bookmark = Bookmark.new
    @bookmark.user = current_user
    @bookmark.question = Question.find(params[:question_id])
    @interview = Interview.find(params[:interview_id])
    @answer = InterviewQuestion.find_by(interview: @interview, question: @bookmark.question).answers.first
    if @bookmark.save
      respond_to do |format|
        format.html
        format.text do
          render partial: "bookmark", locals: { question: @bookmark.question, interview: @interview, answer: @answer }, formats: [:html]
        end
      end
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @question = @bookmark.question
    @interview = Interview.find(params[:interview_id])
    @interview_question = InterviewQuestion.find_by(interview: @interview, question: @question)
    @bookmark.destroy
    respond_to do |format|
      format.html
      format.text do
        render partial: "bookmark", locals: { question: @bookmark.question, answer: @interview_question.answers.first, interview: @interview}, formats: [:html]
      end
    end
  end
end
