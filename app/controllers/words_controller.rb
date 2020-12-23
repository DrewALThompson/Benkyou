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
        end
    end 

    def edit
    end

    def update
    end 

    def destroy
    end 

    private

    def word_params
        params.require(:word).permit(:name, :name2, :definition, :user_id)
    end

    def find_word
        @word = Word.find(params[:id])
    end
end
