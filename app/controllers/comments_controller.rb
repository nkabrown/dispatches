class CommentsController < ApplicationController
	
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

end
