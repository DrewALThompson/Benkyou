class Project < ApplicationRecord
    belongs_to :user
    has_many :translations
    has_many :comments
    
end
