class UsersController < ApplicationController
  before_action :load_user, only: [:show]
  
  def show
  end
  
  private
  def load_user
    @user = User.find_by(friendly_id: params[:id])
  end
end
