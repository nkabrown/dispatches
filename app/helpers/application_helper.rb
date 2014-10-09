module ApplicationHelper

  def current_user
    session[:user_id] ? User.find(session[:user_id]) : nil
  end

  def current_post
  	session[:post_id] ? Post.find(session[:post_id]) : nil
  end


end
