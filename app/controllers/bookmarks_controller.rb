class BookmarksController < ApplicationController
  def create
    @bookmark = Bookmark.new
    @bookmark.user = current_user
    @bookmark.question = Question.find(params[:question_id])
    @interview = Interview.find(params[:interview_id])
    if @bookmark.save
      redirect_to feedback_interview_path(@interview, question_id: @bookmark.question.id, turbo: false)
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @interview = Interview.find(params[:interview_id])
    @bookmark.destroy
    redirect_to feedback_path(@interview, question_id: @bookmark.question.id, turbo: false)
  end
end
