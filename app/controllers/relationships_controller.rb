class RelationshipsController < ApplicationController
	def follow
		current_user.follow(params[:id])
		@user = User.find(params[:id])
		# redirect_to users_path
	end

	def unfollow
		current_user.unfollow(params[:id])
		@user = User.find(params[:id])
		# redirect_to users_path
	end
end
