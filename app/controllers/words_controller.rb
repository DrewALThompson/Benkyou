class WordsController < ApplicationController

    def create
        @word = Word.new(word_params)
        if @word.save 
            flash[:alert] = "Word Saved"
        else
            flash[:alert] = "Word is missing either a name or a definition"
        end
    end

    private

    def word_params
        params.require(:word).permit(:name, :name2, :definition, :user_id)
    end
end
