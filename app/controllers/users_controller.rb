class UsersController < ApplicationController
  
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    puts "*********"
    puts params
    puts "*********"
  end

  def show
    #@post = Post.find(params[:id])
    @post = Post.where(current_user.id)
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
      session[:user_id] = @user.id
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

  def update
    if @user.update(user_params)
      flash[:notice] = "You've updated your account."
      redirect_to users_path
    else
      flash[:alert] = "There was a problem with updating your account. Please try again."
      render edit_user_path(@user)
    end
  end

  def destroy
    if @user.destroy
      session[:user_id] = nil
      flash[:notice] = "We're sorry to see you go. Your account has been deleted."
      redirect_to root_path
    else
      flash[:alert] = "There was a problem deleting your account."
      redirect_to users_path
    end

  end
  
  private

  def user_params
    params.require(:user).permit(:fname, :lname, :email, :username, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end


end