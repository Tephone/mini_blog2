class BlogsController < ApplicationController
  def index
    @blogs = Blog.where(user_id: current_user.following_ids).page(params[:page]).per(3)
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