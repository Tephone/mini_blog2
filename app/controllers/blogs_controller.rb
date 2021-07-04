class BlogsController < ApplicationController
  def index
    @blogs = Blog.all.page(params[:page]).per(5)
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = current_user.blogs.build(params.require(:blog).permit(:content))
    if @blog.save
      redirect_to blogs_path, notice: 'mini_blogを作成しました'
    else
      render :new
    end
  end
end