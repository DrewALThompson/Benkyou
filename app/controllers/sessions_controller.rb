class SessionsController < ApplicationController
    
    def new
    end 

    def create
        @user = User.find_by(name: params[:name])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to root_url
        else
            flash.now[:notice] = 'Username or Password was incorrect'
            render :new
        end
    end 

    def destroy
        session.delete :user_id
        redirect_to root_url
    end 
end
