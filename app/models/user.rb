class User < ApplicationRecord
    has_many :projects
    has_many :words
    has_many :comments, through: :projects
    has_many :comments, through: :translations
end
