class BooksController < ApplicationController
	before_action :authenticate_user!
	def new
		@book_new = Book.new
	end

	def create
		@book_new = Book.new(book_params)
		@book_new.user_id = current_user.id
		if @book_new.save
			redirect_to @book, notice: 'You have creatad book successfully.'
		else
			@books = Book.all
			@user = current_user
			@book_data = @book
			render :index
		end
	end

	def index
		@books = Book.all
		@book_new = Book.new
		@user = current_user
	end

	def show
		@book = Book.find(params[:id])
		@user = @book.user
		@book_new = Book.new
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
		book = Book.find(params[:id])
		book.update(book_params)
		redirect_to book_path(book.id), notice: 'You have updated book successfully.'
	end


	private
	def book_params
		params.require(:book).permit(:title, :body)
	end
end
