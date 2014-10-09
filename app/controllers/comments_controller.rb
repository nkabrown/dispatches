class CommentsController < ApplicationController
	before_action :set_comment, only: [:edit, :update, :destroy]

	def index 
		@comment = Comment.all
		@post = Post.find(params[:post_id])
	end

	# def show

	# end

	def new
		@comment = Comment.new
		@post = Post.find(params[:post_id])
	end

	def create  
		@user = User.find(current_user.id)
		#@post = Post.find(params[:id])
  		#@comment = @commentable.comments.build(params[:comment]) 
		@comment = Comment.new(comments_params)
		if @comment.save
			flash[:notice] = "You've commented on that dispatch"
			redirect_to post_comments_path 
		else
			flash[:alert] = "There was a problem generating your comment."
			render :new
		end
	end

	def edit

	end

	def update
		if @comment.update(comment_params)
			flash[:notice] = "You've updated your comment."
		else
			flash[:alert] = "There was a problem updating your comment."
		end
	end

	def destroy
		@comment.destroy
		redirect_to 
	end

	private

	def comments_params
		params.require(:comment).permit(:body).merge(post_id: current_user.id)
	end

	def set_comment
		@comment = Comment.find(params[:id])
	end

end
