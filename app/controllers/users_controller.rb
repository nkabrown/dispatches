class UsersController < ApplicationController
  before_action :set_user, only: [:index, :show, :edit]

  def index
    @users = User.all
    puts "*********"
    puts params
    puts "*********"
  end

  def show
    puts "********"
    puts params
    puts "********"
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
      redirect_to users_path
    else
      flash[:alert] = "We had a problem signing you in."
      render :new
    end
  end

  def edit 
    puts "********"
    puts params
    puts "********"
  end
  
  private

  def user_params
    params.require(:user).permit(:fname, :lname, :email, :username, :password)
  end

  def set_user
    @user = User.find(session[:user_id])
  end

end