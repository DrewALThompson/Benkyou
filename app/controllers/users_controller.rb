class UsersController < ApplicationController

    def index
        @users = User.all
    end 

    def new
        @user = User.new
    end 

    def create 
        @user = User.create(user_params)
        if @user.valid?
            session[:id] = @user.id
            redirect_to root_url
        else
            flash.now[:message] = 'Your username or password was invalid please try again'
            render :new
        end
    end 

    def show
        find_user
    end 

    def edit 
        find_user
    end

    def update
        find_user 
    end 

    def delete
    end 

    private

    def find_user
        @user = User.find_by(id: params[:id])
    end 

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
