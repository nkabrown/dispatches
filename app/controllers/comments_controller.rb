class CommentsController < ApplicationController
	before_action :set_comment, only: [:edit, :update, :destroy]

	def new
		@posts = Post.all
		@post = Post.find(params[:id])

	end

	def create
		@comment = Comment.new(comment_params)
		if @comment.save
			flash[:notice] = "You've commented on that dispatch"
		else
			flash[:alert] = "There was a problem generating your comment."
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
		params.require(:comment).permit()
	end

	def set_comment
		@comment = Comment.find(params[:id])
	end

end
