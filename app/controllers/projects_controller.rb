class ProjectsController < ApplicationController
    before_action :require_login, except: [:index, :show, :edit]
    before_action :pre_load_word_comment_project, only: [:show, :edit]

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
        redirect_to root_url unless @project.id == current_user.id
    end

    def update
    end

    private

    def pre_load_word_comment_project
        @project = Project.find(params[:id])
        @comments = @project.comments
        @comment = Comment.new
        if current_user
            @word = Word.new
            @words = current_user.words
        end
    end
end
