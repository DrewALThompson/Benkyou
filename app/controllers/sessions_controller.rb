class SessionsController < ApplicationController
    
    def new
    end 

    def create
        user = User.find_by(name: params[:user][:name])
        if user && user.authenticate(password: params[:user][:password])
            session[:user_id] = user.id
            redirect_to root_url
        else
            flash[:notice] = 'Username or Password was incorrect'
            render :new
        end
    end 

    def destroy
    end 
end
