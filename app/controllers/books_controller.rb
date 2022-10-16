class BooksController < ApplicationController
  
  before_action :currect_user, only: [:edit, :update]
  
  def show
    @book = Book.new
    @books = Book.all
    @user = currect_user
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = currect_user
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    
    if @book.update(book_params)
       redirect_to book_path(@book) 
       flash[:success]="You have updated book successfully."
    else
       render :edit
    end
  end
  
  def create
    @book=Book.new(book_params)
    @user = @books.user
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
