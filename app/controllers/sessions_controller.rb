class SessionsController < ApplicationController
    
    def new
    end 

    def create
        if  auth
            @user = User.find_by(uid: oauth_uid)
            if @user
                user_welcome
            else
                @user = User.find_by(email: oauth_email)
                if @user
                    @user.uid = oauth_uid
                    user_welcome
                else
                  @user = User.create(name: auth['info']['name'], email: 'temp@temp.com', password: 'Temporary1', uid: oauth_uid)
                  if @user.valid?
                    session[:user_id] = @user.id
                    flash.notice = 'Please make sure to change your email and password! They are set to temp@temp.com & Temporary1'
                    redirect_to edit_user_path(@user)
                  else
                    flash.notice = 'Failed to find or create User'
                    redirect_to login_path
                  end
                end
            end
        else 
            @user = User.find_by(name: params[:name])
            if @user && @user.authenticate(params[:password])
               user_welcome
            else
               flash.now[:notice] = 'Username or Password was incorrect'
               render :new
            end
        end
    end 



    def destroy
        session.delete :user_id
        redirect_to root_url
    end 

    private

    def auth
        request.env['omniauth.auth']
    end

    def oauth_uid
        auth["uid"]
    end
    
    def oauth_email
        auth["info"]["email"]
    end

    def user_welcome
        session[:user_id] = @user.id
        flash.notice = "Welcome back #{@user.name}!"
        redirect_to root_url
    end
end
