class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    users_path
  end
  
  def after_sign_out_path_for(resouece)
    root_path
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
  end
  
  protected
  
  def configure_permitted_parameters
     devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end