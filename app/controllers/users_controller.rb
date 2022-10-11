class UsersController < ApplicationController
  
  before_action :correct_user,   only: [:edit, :update]
  
  def show
    @book_new = Book.new
    @user = User.find(params[:id])
    @books = @user.books
    @post_images = @user.post_images
  end
  
  def edit
    @user = User.find(params[:id])
  end

  def index
    @user = current_user
    @users = User.all
    @book_new = Book.new
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id)
    flash[:notice] = "You have updated user successfully."
    else
    render :edit
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  def correct_user
      @user = User.find(params[:id])
      if current_user != @user
       redirect_to user_path(@user)
      end
  end
end
