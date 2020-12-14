class User < ApplicationRecord
    has_many :projects, :words
    has_many :comments, through: :projects
end
