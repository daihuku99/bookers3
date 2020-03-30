class BooksController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user, only: [:edit, :update, :delete]
	def new
		@book_new = Book.new
	end

	def create
		@book_new = Book.new(book_params)
		@book_new.user_id = current_user.id
		if @book_new.save
			redirect_to book_path(@book_new.id), notice: 'You have creatad book successfully.'
		else
			@books = Book.all
			@user = current_user
			render :index
		end
	end

	def index
		@books = Book.page(params[:page]).reverse_order
		@book_new = Book.new
		@user = current_user
		# @users = @book.user
	end

	def show
		@book = Book.find(params[:id])
		@user = @book.user
		@book_new = Book.new
		@comment = Comment.new
		# @bookcomment = current_user.comments.find(book_id: @book.id)
	end

	def destroy
		book = Book.find(params[:id])
		book.destroy
		redirect_to book
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		if @book.update(book_params)
			redirect_to book_path(@book.id), notice: 'You have updated book successfully.'
		else
			render :edit
		end
	end

	def correct_user
	    @book = Book.find(params[:id])
	      if @book.user.id != current_user.id
	        redirect_to books_path
	      end
    end

	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
