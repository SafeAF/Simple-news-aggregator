class HomeController < ApplicationController

	def index
		 @posts = Post.order(upvotes: :desc, created_at: :desc).limit(30)
	end
end