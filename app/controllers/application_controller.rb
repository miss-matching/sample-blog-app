# -*- coding: utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery

  # ApplicationControllerは各コントローラの基底クラスになるので
  # このフィルターは各コントローラに適用される
  # フィルターを適用したくない場合は`:skip_before_filter`を使う
  # @see app/controllers/home_controller.rb
  before_filter :require_login

  private

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to root_url
    end
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @_current_user ||= session[:current_user_id] &&
      User.find_by_id(session[:current_user_id])
  end
end
