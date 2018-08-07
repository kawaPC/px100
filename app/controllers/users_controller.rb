class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update, :destroy]
  
  def show
    # URL設定済みの場合はfriendlyなURLにリダイレクト
    if @user.friendly_id && params[:id] != @user.friendly_id
      redirect_to("/#{@user.friendly_id}")
    end
    @albums = Album.where(user_id: @user.id)
  end
  
  def edit
  end
  
  def update
  end
  
  private
  def load_user
    @user = User.find_by_friendly_id_or_id(params[:id])
  end
end
