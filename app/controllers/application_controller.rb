class ApplicationController < ActionController::Base
    helper_method :current_user, :require_login, :require_admin

    def current_user
        session[:user_id] ||= nil
        if session[:user_id] != nil
            @user = User.find_by(id: params[:user_id])
        end
    end

    def require_login
        redirect_to root_url unless current_user
    end

    def require_admin
        redirect_to root_url unless current_user.admin
    end 


end
