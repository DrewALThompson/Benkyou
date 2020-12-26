class WordsController < ApplicationController
    before_action :current_user, only: [:index, :edit, :show]
    before_action :require_login, only: [:index, :edit, :show]
    before_action :find_word, only: [:show, :edit, :update, :destroy]

    def create
        @word = Word.new(word_params)
        if @word.save 
            flash[:alert] = "Word Saved"
            redirect_back(fallback_location: root_path)
        else
            flash[:alert] = "Word is missing either a name or a definition"
            redirect_back(fallback_location: root_path)
        end
    end

    def show
    end

    def index 
        if params[:user_id]
            @words = User.find(params[:user_id]).words
        else 
            redirect_to root_url
        end
    end 

    def edit
        redirect_to root_url unless current_user.id == @word.user_id
    end

    def update
        @word.update(word_params)
        if @word.valid?
            redirect_to user_words_path(current_user)
        else
            flash.now[:alert] = "Failed to update #{@word.name}. Please make sure to have a name and a definition."
            render 'edit'
        end
    end 

    def destroy
        find_word.destroy
        redirect_to words_path
    end 

    private

    def word_params
        params.require(:word).permit(:name, :name2, :definition, :user_id)
    end

    def find_word
        @word = Word.find(params[:id])
    end
end
