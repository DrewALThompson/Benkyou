class Comment < ApplicationRecord
    t.text :content
    belongs_to :user
    belongs_to :project
end
