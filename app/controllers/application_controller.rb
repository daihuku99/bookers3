class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
		books_path
	end

	def after_sign_out_path_for(resource)
		"/"
	end

	def search
    	@user_or_book = params[:option]
    	if @user_or_book == "1"
      		@users = ApplicationRecord.search(params[:search], @user_or_book)
    	else
      		@books = ApplicationRecord.search(params[:search], @user_or_book)
    	end
    	@user = User.find(current_user.id)
  		@book_new = Book.new
  	end

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
		#added_attrs = [:name, :email]
		#devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
	end
end
