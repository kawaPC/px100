class ApplicationController < ActionController::Base
    def forbid_login_user
        if current_user
          redirect_to("/#{current_user.id}")
        end
    end
end