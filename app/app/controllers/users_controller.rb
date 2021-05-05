class UsersController < ApplicationController
	before_action :authenticate_user!


  	def show
  		@user = User.find(params[:id])
  	end

  	def posts
  		#@user_posts = User.find(params[:id].posts)
  	end
end