class PostsController < ApplicationController

	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index 
		@posts = Post.all
		@user = User.find(current_user.id)
	end

	def show
		@users = User.all
		# set_post
		@user = User.find(current_user.id)
	end

	def new
		@post = Post.new
		@user = User.find(current_user.id)
	end

	def create
		@user = User.find(current_user.id)
		@post = Post.new(post_params)
		if @post.save
			flash[:notice] = "You've posted a new dispatch!"
			redirect_to @post
		else
			flash[:alert] = "There was a problem signing you up. Try again"
			render :new
		end
	end

	def edit
		# set_post
		@user = User.find(current_user.id)
	end

	def update
		@user = User.find(current_user.id)
		if @post.update(post_params)
			flash[:notice] = "Your dispatch has been updated."
			redirect_to @post
		else
			flash[:alert] = "There was a problem with your edit, please try again."
			render :edit
		end
	end

	def destroy
		@user = User.find(current_user.id)
		if @post.destroy
			flash[:notice] = "Your post has been deleted from the feed."
			redirect_to users_path
		else
			flash[:alert] = "There was a problem deleting your post."
			redirect_to users_path
		end
	end


	private

	def post_params
		params.require(:post).permit(:title, :body).merge(user_id: current_user.id) 
	end
	
	def set_post
		@post = Post.find(params[:id])
	end

end
