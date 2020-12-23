class ProjectsController < ApplicationController
    before_action :require_login, except: [:index, :show, :edit, :create]
    before_action :pre_load_word_comment_project, only: [:show, :edit]

    def index
        if params[:user_id]
            @projects = User.find(params[:user_id]).owned_projects 
        else
          @projects = Project.all
        end
    end

    def new
        @project = Project.new
    end

    def create
        @project = Project.new(project_params)
        if @project.save
            redirect_to project_path(@project)
        else
            render :new
        end
    end

    def show
       
    end

    def edit
        redirect_to root_url unless @project.owner_id == current_user.id
    end

    def update
        @project = Project.find(params[:id])
        @project.update(project_params)
        if @project.save
            render :show
        else
            flash[:alert] = "Project failed to save"
            render :show
        end
    end

    private

    def project_params
        params.require(:project).permit(:title, :content, :translation, :translation_title, :owner_id)
    end

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
