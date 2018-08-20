class HomeController < ApplicationController
  before_action :forbid_login_user, only: [:top]
  layout 'home'

  def top
  end
end