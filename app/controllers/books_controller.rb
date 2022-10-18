class BooksController < ApplicationController
  
  before_action :current_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  
  def show
    @book = Book.find(params[:id])
    @books = Book.all
  end

  def index
    @books = Book.all
    @book_new = Book.new
    @book = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    
    if @book.update(book_params)
       redirect_to book_path(@book) 
       flash[:notice]="You have updated book successfully."
    else
       render :edit
    end
  end
  
  def create
    @book=Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
       redirect_to book_path(@book.id)
       flash[:notice] = "You have created book successfully."
    else 
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
  
  
end
