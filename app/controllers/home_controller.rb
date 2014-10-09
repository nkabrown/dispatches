class HomeController < ApplicationController

  def index
    puts "*******"
    puts session[:user_id]
    puts "*******"
    session[:user_id] = nil
    puts "*******"
    puts session[:user_id]
    puts "*******"
  end
  
end