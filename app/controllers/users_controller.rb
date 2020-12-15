class UsersController < ApplicationController

    def index
        @users = User.all
    end 

    def new
        
    end 

    def create 
    end 

    def show
    end 

    def edit 
    end

    def update
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
