class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update, :destroy]
  
  def show
  end
  
  def create
  end
  
  def edit
  end
  
  def update
  end
  
  private
  def load_user
    @user = User.find_by(friendly_id: params[:name])
  end
end
