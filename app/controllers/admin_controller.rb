class AdminController < ApplicationController
    before_action :require_admin, only: [:index, :edit, :update, :stats]
    def index 
        @users = User.all
        @projects = Project.all
    end 

    def edit

    end

    def update
    end 

    def stats
    end
end 