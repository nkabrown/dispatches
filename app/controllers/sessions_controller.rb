class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.where(username: params[:username]).first
    if @user && @user.password == params[:password]
      flash[:notice] = "Welcome to the Newsroom."
      session[:user_id] = @user.id
      flash[:notice] = "Logged in!"
      redirect_to users_path
      puts "**********"
      puts session[:user_id]
      puts "**********"
    else
      flash[:alert] = "There was a problem signing you in. Please try again."
      render :new
    end
  end

  def destroy
    @user = User.find(session[:user_id])
    puts "*********"
    puts session[:user_id]
    puts "*********"
    session[:user_id] = nil
    puts "*********"
    puts session[:user_id]
    puts "*********"
    redirect_to root_path
  end

end