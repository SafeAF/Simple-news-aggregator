class HomeController < ApplicationController

	def index
		 @newest_posts = Post.order(created_at: :desc, cached_votes_up: :desc).limit(10)
		 #@top_posts = Post.order(cached_votes_up: :desc).limit(30)
	end
end