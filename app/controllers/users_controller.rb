class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Thanks for signing up!"
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
    @tags = Bookmark.find_by(user_id: @user.id).tag_counts
    @bookmark = Bookmark.find_by(user_id: @user.id)
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
