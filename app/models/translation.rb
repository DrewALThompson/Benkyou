class Translation < ApplicationRecord
    has_many :projects
    has_many :translations, through: :projects

end
