class UsersController < ApplicationController
    before_action :find_user, only: [:show, :edit, :update, :destroy]
    before_action :require_login, only: [:edit, :update, :destroy]
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
            session[:user_id] = @user.id
            flash.alert = 'Welcome to Benkyou!'
            redirect_to root_url
        else
            flash.now[:alert] = 'User failed to create! Please try again.'
            render :new
        end
    end 

    def show

    end 

    def edit 
        not_user_or_admin
    end

    def update
        @user.update(user_params)
        if @user.valid?
            redirect_to user_projects_path(@user)
        else
           flash.now.alert = "Failed to update #{@user.name}. Please make sure all fields are filled in correctly."
           render 'edit'
        end
    end 

    def destroy
        destroy_all
        @user.delete
        redirect_to root_url
    end 

    private

    def find_user
        @user = User.find_by(id: params[:id])
    end 

    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
    end

    def not_user_or_admin
        redirect_to root_url unless current_user.id == find_user.id || current_user.admin
    end

    def destroy_all
        @user.owned_projects.delete_all
        @user.comments.delete_all
    end


end
