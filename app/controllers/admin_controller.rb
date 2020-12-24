class AdminController < ApplicationController
    before_action :require_admin, only: [:index, :edit, :update, :stats]
    def index 
    end 

    def edit

    end

    def update
    end 

    def stats
        @users = User.all
        @projects = Project.all
        @words = Word.all
        @comments = Comment.all
    end
end 