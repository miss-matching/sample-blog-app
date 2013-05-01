class HomeController < ApplicationController
  def index
  end

  def create
    if user = User.authenticate(params[:username], params[:password])
      session[:current_user_id] = user.id
      redirect_to posts_path
    else
      flash.now[:error] = "Login fail"
      render "index"
    end
  end
end
