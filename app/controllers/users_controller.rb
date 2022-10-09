class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images
  end

  def index
    @user = User.all
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
end
