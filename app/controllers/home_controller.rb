# -*- coding: utf-8 -*-
class HomeController < ApplicationController
  skip_before_filter :require_login, :only => :index

  # http://guides.rubyonrails.org/getting_started.html
  # ガイドを参考に作成、filterについては以下
  # http://guides.rubyonrails.org/action_controller_overview.html
  # ホームというよりログイン画面

  def index
  end
end
