class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new(params[:bookmark])
  end

  def create
    @bookmark = Bookmark.new(params[:bookmark])
    @bookmark.save!
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

end
