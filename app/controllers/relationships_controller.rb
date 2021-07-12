class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:relationship][:followed_id])
    if current_user.active_relationships.create!(followed_id: @user.id)
      redirect_to users_path, notice: "#{@user.name}さんをフォローしました"
    end
  end

  def destroy
    @relationship = Relationship.find(params[:id])
    if @relationship.destroy
      redirect_to users_path, notice: "#{@relationship.followed.name}フォローを解除しました"
    end
  end
end
