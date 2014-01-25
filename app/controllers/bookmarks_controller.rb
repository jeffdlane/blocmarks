class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.create(bookmark_params)
    @bookmark.save!
    redirect_to action: 'index'

  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

private

  def bookmark_params
    params.require(:bookmark).permit(:title, :url)
  end

end
