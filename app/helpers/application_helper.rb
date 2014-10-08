module ApplicationHelper

  def current_session
    session[:user_id] ? User.find(session[:user_id]) : nil
  end

end
