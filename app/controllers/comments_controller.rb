class CommentsController < ApplicationController
	#before_action :set_comment, only: [:edit, :update, :destroy]

	def new
		@comment = Comment.new
		@post = Post.find(params[:post_id])
	end

	def create  
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create(comment_params)
		if @comment.save
			flash[:notice] = "You've commented on that dispatch"
			redirect_to users_path
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
		@post = Post.find(params[:post_id])
		@comment = @post.comments.find(params[:id])
		@comment.destroy
		redirect_to post_path(@post)
	end

	private

	def comment_params
		params.require(:comment).permit(:body)
	end

	# def set_comment
	# 	@comment = Comment.find(params[:id])
	# end

end
