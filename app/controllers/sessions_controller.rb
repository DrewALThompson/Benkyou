class SessionsController < ApplicationController
    
    def new
    end 

    def create
        if auth_hash = request.env["omniauth.auth"]
            user = User.find_or_create_by(email: oauth_email) do |u|
                u.name = auth['info']['name']
                u.email = auth['info']['email']
                u.password = auth['info']['password']
                u.uid = auth['uid']
            end
            session[:user_id] = user.id
            redirect_to root_url
        else 
            user = User.find_by(name: params[:name])
            if user && user.authenticate(params[:password])
               session[:user_id] = user.id
               redirect_to root_url
            else
               flash.now[:notice] = 'Username or Password was incorrect'
               render :new
            end
        end
    end 

    # def facebook
    #     @user = User.find_or_create_by(uid: auth['uid']) do |u|
    #         u.name = auth['info']['name']
    #         u.email = auth['info']['email']
    #         u.password = auth['info']['password']
    #         u.uid = auth['uid']
    #     end

    #     session[:user_id] = @user.id
    #     redirect_to root_url
    # end

    def destroy
        session.delete :user_id
        redirect_to root_url
    end 

    private

    def auth
        request.env['omniauth.auth']
    end

    def oauth_email
        request.env["omniauth.auth"]["email"]
    end
end
