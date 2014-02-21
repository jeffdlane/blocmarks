class BookmarksController < ApplicationController
  respond_to :html, :js
  before_filter :authorize, only: [:edit, :update, :destroy]

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
    flash[:notice] = "Bookmark created"
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    @bookmark.update_attributes(bookmark_params)
    flash[:notice] = "Bookmark updated"
    redirect_to action: 'index', notice: "bookmark updated"
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.destroy
      flash[:notice] = "Bookmark deleted"
    else
      flash[:error] = "Something went wrong"
    end

    respond_with(@bookmark) do |f|
      f.html { redirect_to action 'index'}
    end
  end

private

  def bookmark_params
    params.require(:bookmark).permit(:title, :url, :tag_list)
  end

end
