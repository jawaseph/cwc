class PostsController < ApplicationController
	before_action :signed_in_user, only: [:new, :create, :destroy]

	def new
		@post = Post.new
	end

	def create
		@post = current_user.posts.build(post_params)
		if @post.save
			flash[:success] = "Missed Connection Posted!"
			redirect_to current_user
		else
			render 'new'
		end
	end

	def destroy

	end

	private

	def post_params
		params.require(:post).permit(:title, :content)
	end
end
