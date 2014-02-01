class TagsController < ApplicationController
  def index
    @tags = Bookmark.tag_counts
  end

  def show
    @bookmarks = Bookmark.tagged_with(params[:id])
    render 'bookmarks/index'
  end
end
