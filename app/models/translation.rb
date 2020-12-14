class Translation < ApplicationRecord
    belongs_to :user
    belongs_to :project
    has_many :comments
end
