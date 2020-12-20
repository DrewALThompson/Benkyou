class ProjectsController < ApplicationController
    before_action :require_login, except: [:index, :show]

    def index
        @projects = Project.all
    end

    def new
        @project = Project.new
    end

    def create
        @project = Project.create(title: params[:title], content: params[:content], owner_id: params[:owner_ids])
        if @project.valid?
            redirect_to project_path(@project)
        else
            render :new
        end
    end

    def show
    end

    def edit
    end

    def update
    end

    private

    def find_project
        @project = Project.find(params[:id])
    end
end
