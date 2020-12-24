class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :delete]
    before_action :require_login, only: [:edit, :update, :delete]
    before_action :require_admin, only: [:index]

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
        redirect_to user_projects_path(@user)
    end 

    def edit 
        redirect_to root_url unless current_user.id == find_user.id || current_user.admin
    end

    def update
        @user.update(user_params)
        if @user.valid?
            redirect_to user_projects_path(@user)
        else
           render 'edit'
        end
    end 

    def delete
    end 

    private

    def find_user
        @user = User.find_by(id: params[:id])
    end 

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
    end

end
