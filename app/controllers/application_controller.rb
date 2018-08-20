class ApplicationController < ActionController::Base
  def forbid_login_user
    if user_signed_in?
      redirect_to user_albums_path(current_user)
    end
  end

  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    user_albums_path(resource)
  end
end