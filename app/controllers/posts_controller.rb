class PostsController < ApplicationController

	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index 
		@posts = Post.all
	end

	def show

	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new
		if @post.save
			flash[:notice] = "You've become one of our new dispachers!"
			redirect_to @post
		else
			flash[:alert] = "There was a problem signing you up. Try again"
			render :new
		end
	end

	def edit
		# set_post
	end

	def update

	end

	def destroy

	end


	private

	def post_params
		params.require(:post).permit(:title, :body)
		# .merge(user_id: current_user.id --- in case we want to do this later - Maneesh's code
	end

	def set_post
		@post = Post.find(params[:id])
	end

end
