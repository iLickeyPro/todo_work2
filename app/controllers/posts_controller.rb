class PostsController < ApplicationController
  def top
    @todo = []
    @done = []
    posts = Post.all.order(created_at: :desc)
    posts.each do |post|
      if post.kind == 0 then
        @todo << post
      else
        @done << post
      end
    end
    if flash[:result].present?
      if flash[:result]
        @message = "Success"
      else
        @message = "Failure"
      end
    else
      @message = ""
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def create
    post = Post.new(kind:0, name:params[:name], content:params[:content])
    result = post.save
    redirect_to("/" ,flash:{result:1})
  end

  def rewrite
    post = Post.find_by(id: params[:id])
    post.name = params[:name]
    post.content = params[:content]
    result = post.save
    redirect_to("/" ,flash:{result:1})
  end

  def move
    post = Post.find_by(id: params[:id])
    if post.kind == 0 then
      post.kind = 1
    else
      post.kind = 0
    end
    result = post.save
    redirect_to("/" ,flash:{result:1})
  end
end
