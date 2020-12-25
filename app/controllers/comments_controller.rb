class CommentsController < ApplicationController
    before_action :require_login
    before_action :find_comment, except: [:create]
    
    def create
        @comment = Comment.new(comment_params)
        if @comment.save
            redirect_back(fallback_location: root_path)
        end
    end

    def edit
        
    end

    def update
        @comment.update(comment_params)
        if @comment.valid?
            redirect_to project_path(@comment.project)
        else
            render 'edit'
        end
    end

    def destroy
        @comment.destroy
        redirect_to projects_path
    end

    private

    def find_comment
        @comment = Comment.find(params[:id])
    end

    def comment_params
        params.require(:comment).permit(:content, :commenter_id, :project_id)
    end

    def find_comment
        @comment = Comment.find(params[:id])
    end

end
