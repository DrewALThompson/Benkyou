class WordsController < ApplicationController

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

    def index 
        @user = User.find(params[:id])
    end 

    private

    def word_params
        params.require(:word).permit(:name, :name2, :definition, :user_id)
    end
end
