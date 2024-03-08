class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all.where(user: current_user)
  end
end
