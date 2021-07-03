class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(params.require(:blog).permit(:content))
    if @blog.save
      redirect_to blogs_path, notice: 'mini_blogを作成しました'
    else
      render :new
    end
  end
end