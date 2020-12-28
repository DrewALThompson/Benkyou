class Word < ApplicationRecord
    belongs_to :user
    # validates :name, presence: true
    # validates :definition, presence: true
end
