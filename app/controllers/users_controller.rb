class UsersController < ApplicationController
	before_action :authenticate_user!
  def index
  	@users = User.all
    @user = User.find(current_user.id)
  	@book = Book.new
  end

  def show
  	@users = User.find(params[:id])
  	@user = User.new
  	@book = Book.new
  	@books = Book.where(user_id: @users.id)
  end

  def new
  	@user = User.new
  end

  def edit
  	@user = User.find(params[:id])
  	 if current_user.id != @user.id
      flash[:notice] = "error"
      redirect_to user_path(current_user.id)
    end
  end

  def update
  	@user = User.find(params[:id])
  	if @user.update(user_params)
  	flash[:notice] = "You have update user successfully."
    redirect_to user_path(@user.id)
 else
 	flash[:notice] = "error"
 	redirect_to user_path(@user.id)
   end
  end

  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	redirect_to users_path
 end

  private
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
