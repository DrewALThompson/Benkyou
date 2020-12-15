class User < ApplicationRecord
    has_many :projects
    has_many :words
    has_many :comments, through: :projects
    has_many :comments, through: :translations
    has_secure_password

    validates
end
