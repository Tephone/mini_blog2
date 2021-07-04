class RelationshipsController < ApplicationController
  def create
    @user = User.find(params[:relationship][:followed_id])
    if current_user.active_relationships.create!(followed_id: @user.id)
      redirect_to users_path, notice: "#{@user.name}さんをフォローしました"
    end
  end

  def destroy
    @record = Relationship.find(params[:id])
    if @record.destroy
      redirect_to users_path, notice: "#{@record.followed.name}フォローを解除しました"
    end
  end
end
