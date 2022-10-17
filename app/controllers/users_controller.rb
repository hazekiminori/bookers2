class UsersController < ApplicationController
  
  before_action :current_user,   only: [:edit, :update]
  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @image = @user.profile_image
    @book = Book.new
  end
  
  def index
    @user = User.find(params[:id])
    @users = User.all
  end
  
  def edit
    @user = User.find(params[:id])
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
  
  def create
    @book = Book.new
    @book.user_id = current_user.id
    if @book.save
       redirect_to book_path(@book.id)
       flash[:notice] = "You have created book successfully."
    else 
      @books = Book.all
      @user = current_user
      render :index
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end
  

end