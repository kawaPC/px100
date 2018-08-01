class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @albums = Album.where(user_id: @user.id)
  end
end
