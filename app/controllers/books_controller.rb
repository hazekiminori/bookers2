class BooksController < ApplicationController
  def show
  end

  def index
  end

  def new
    @book = Book.new
  end
end
