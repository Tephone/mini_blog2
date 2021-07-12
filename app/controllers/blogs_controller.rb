class BlogsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    if user_signed_in?
      @blogs = Blog.where(user_id: current_user.following_ids).page(params[:page]).per(3)
    else
      @blogs = Blog.all.page(params[:page]).per(5)
    end
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