# -*- coding: utf-8 -*-
class LoginsController < ApplicationController
  skip_before_filter :require_login, :only => :create

  # http://guides.rubyonrails.org/action_controller_overview.html
  # ガイドを参考に作成
  # loginsもresourceとして定義 @see config/routes.rb

  def create
    if user = User.authenticate(params[:username], params[:password])
      session[:current_user_id] = user.id
      redirect_to posts_path # ログインできていたら投稿一覧へ
    else
      flash.now[:error] = "Login fail"
      render "home/index"
    end
  end
end
