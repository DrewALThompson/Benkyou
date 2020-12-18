class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :require_login, :require_admin

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def require_login
        redirect_to root_url unless current_user
    end

    def require_admin
        redirect_to root_url unless current_user.admin
    end 


end
