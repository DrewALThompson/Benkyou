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
        pre_load_word_comment_project
    end

    def edit
        pre_load_word_comment_project
    end

    def update
    end

    private

    def pre_load_word_comment_project
        @project = Project.find(params[:id])
        @word = Word.new
        @words = current_user.words
        @comments = @project.comments
        @comment = Comment.new
    end
end
