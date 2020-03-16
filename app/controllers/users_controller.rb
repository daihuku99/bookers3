class UsersController < ApplicationController
	before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]
  def index
  	@users = User.all
  	@user = User.find(current_user.id)
  	@book_new = Book.new
  end

  def show
  	@user = User.find(params[:id])
  	@books = @user.books
  	# Book.where(user_id: @user.id)
  	@book_new = Book.new
  end

  def edit
  end

  def update
  	if @user.update(user_params)
  		redirect_to user_path(current_user.id), notice: 'You have updated user successfully.'
  	else
  		render :edit
  	end
  end

  def correct_user
    @user = User.find(params[:id])
      if @user.id != current_user.id
        redirect_to users_path
      end
  end

  private

  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
