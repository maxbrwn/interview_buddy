class BookmarksController < ApplicationController
  def create

    @bookmark = Bookmark.new
    @bookmark.user = current_user
    @bookmark.question = Question.find(params[:question_id])
    @interview = Interview.find(params[:interview_id])
    if @bookmark.save
      redirect_to feedback_interview_path(@interview)
    end
  end
end
