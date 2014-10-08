class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.where(username: params[:username]).first
    if @user && @user[:password] == params[:password]
      flash[:notice] = "Welcome to the Newsroom."
      session[:user_id] = @user.id
      redirect_to users_path
      puts "**********"
      puts session[:user_id]
      puts "**********"
    else
      flash[:notice] = "There was a problem signing you in. Please try again."
      render :new
    end
  end

  def destroy

  end

end