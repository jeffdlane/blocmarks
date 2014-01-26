class BookmarksController < ApplicationController
  def index
    if params[:tag]
      @bookmarks = Bookmark.tagged_with(params[:tag])
    else
      @bookmarks = Bookmark.all
    end
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new
  end

  def create

    if message.exists?
      Rails.logger.info params
      message = Message.new(
        #:to => params[:envelope][:to],
        #:from => params[:envelope][:from],
        :title => params[:headers]['Subject'],
        :url => params[:plain]
      )
      if message.save
        render :text => 'Success', :status => 200
      else
        render :text => message.errors.full_messages, :status => 422, :content_type => Mime::TEXT.to_s
      end

    else
      @bookmark = Bookmark.create(bookmark_params)
      @bookmark.save!
      redirect_to action: 'index'
    end
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

private

  def bookmark_params
    params.require(:bookmark).permit(:title, :url, :tag_list)
  end

end
