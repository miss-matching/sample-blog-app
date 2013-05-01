# -*- coding: utf-8 -*-
class CommentsController < ApplicationController

  # http://guides.rubyonrails.org/getting_started.html
  # ガイドを参考に作成
  # commentsはpostsのnested resource
  # @see config/routes.rb

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(params[:comment])
    redirect_to post_path @post
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path @post
  end
end
