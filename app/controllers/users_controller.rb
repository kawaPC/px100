class UsersController < ApplicationController
  def show
    @user = User.find_by(name: params[:name])
    @albums = Album.where(user_id: @user.id)
  end
end
