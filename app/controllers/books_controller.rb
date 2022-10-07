class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def new
    @book = Book.new
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       redirect_to book_path(@book) 
       flash[:success]="You have updated book successfully."
    else
       render :edit
    end
  end
  
  def create
    @book = Book.new(book_params)
    if @book.save
       redirect_to book_path
       flash[:notice] = "You have created book successfully."
    else 
      @book = Book.all
      render :index
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to book_path
  end 
  
end
