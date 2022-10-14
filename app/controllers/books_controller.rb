class BooksController < ApplicationController
  
  before_action :correct_user, only: [:edit, :update]
  
  def show
    @books = Book.all
    @book = @user.books
    @book_new = Book.new
    @user = current_user
    @user_image = @user.profile_image
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    
    if @book.update(book_params)
       redirect_to book_path(book.id) 
       flash[:success]="You have updated book successfully."
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
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to book_path
  end 
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def currect_user
        @book = Book.find(params[:id])
        @user = @book.user
        redirect_to(books_path) unless @user == current_user
  end
  
end
