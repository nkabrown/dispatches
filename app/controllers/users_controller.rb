class UsersController < ApplicationController

  def index
    @user = session[:user_id]
  end

  def new 
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    puts "*********"
    puts params
    puts "*********"
    if @user.save
      flash[:notice] = "Thank you for signing up. Now send your dispatches out into the world."
      redirect_to users_path(@user)
    else
      flash[:alert] = "We had a problem signing you in."
      render :new
    end
  end

  def show
    @user = session[:user_id]
  end
  
  private

  def user_params
    params.required(:user).permit(:fname, :lname, :email, :username, :password)
  end


end