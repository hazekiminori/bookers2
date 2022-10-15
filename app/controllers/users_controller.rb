class UsersController < ApplicationController
  
  before_action :correct_user,   only: [:edit, :update]
  before_action :authenticate_user!
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end
  
  def index
    @user = 
    @users = User.all
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update
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
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  
  

def current_user
  if session[:user_id]
    @current_user ||= User.find_by(id: session[:user_id])
  end
end

end