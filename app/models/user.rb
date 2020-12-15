class User < ApplicationRecord
    has_many :projects
    has_many :words
    has_many :comments, through: :projects
    has_many :comments, through: :translations
    has_secure_password

    validates :name, presence: true, length: { minimum: 3}, with: => /[一-龯ぁ-ゔゞァ-・ヽヾ゛゜ーa-zA-Z]/
end
