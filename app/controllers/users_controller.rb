class UsersController < ApplicationController

    def index
        @users = User.all
    end 

    def new
        @user = User.new
    end 

    def create 
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            redirect_to user_path(@user)
        else
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
        find_user
    end 

    private

    def find_user
        @user = User.find_by(id: params[:id])
    end 

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end
