class FavoritesController < ApplicationController
	def create
		@book = Book.find(params[:book_id])
		favorite = Favorite.new
		favorite.user_id = current_user.id
		favorite.book_id = @book.id
		if @book.favorites.where(user_id: current_user.id).exists?
			redirect_to books_path
		else
			favorite.save
		end
	end

	def destroy
		@book = Book.find(params[:book_id])
		favorite = current_user.favorites.find_by(book_id: @book.id)
		favorite.destroy
		# redirect_to books_path
	end
end
