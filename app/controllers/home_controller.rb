class HomeController < ApplicationController
  before_action :forbid_login_user, only: [:top]
  before_action :sample_user
  layout 'home'
  
  def top
  end
  
  def sample_user
    @sample_user = User.find_by(friendly_id: "sample")
  end
end