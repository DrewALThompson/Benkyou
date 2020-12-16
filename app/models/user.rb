class User < ApplicationRecord
    has_many :projects
    has_many :words
    has_many :comments, through: :projects
    has_secure_password

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :name, presence: true,
               length: { minimum: 3, maximum: 254},
               format: { with: /\A[一-龯ぁ-ゔゞァ-・ヽヾ゛゜ーa-zA-Z]/ },
               uniqueness: true
    validates :email, presence: true,
            format: { with: VALID_EMAIL_REGEX, message: "Email invalid" },
            uniqueness: { case_sensitive: false },
            length: { minimum: 4, maximum: 254 }   
end
