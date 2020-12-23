class Project < ApplicationRecord
    belongs_to :owner, :class_name => 'User', :foreign_key => 'owner_id'
    has_many :comments
    has_many :users, through: :comments

    validates :title, presence: true
    validates :content, presence: true
    
end
