class CommentsController < ApplicationController
    before_action :require_login
    before_action :find_comment, except: [:create]
    
    def create
        @comment = Comment.new(comment_params)
        if @comment.save
            redirect_back(fallback_location: root_path)
        else 
            flash.alert = 'Failed to create comment!'
            redirect_back(fallback_location: root_path)
        end
    end

    def edit
        redirect_to root_url unless current_user.id == @comment.commenter_id
    end

    def update
        @comment.update(comment_params)
        if @comment.valid?
            redirect_to project_path(@comment.project)
        else
            flash.now[:alert] = 'Comment failed to edit!'
            render 'edit'
        end
    end

    def destroy
        @comment.destroy
        redirect_back(fallback_location: root_path)
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
