class User < ApplicationRecord
    has_many :owned_projects, :class_name => 'Project', :foreign_key => 'owner_id'
    has_many :words
    has_many :comments
    has_many :projects, through: :comments
    has_secure_password

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :name, presence: true,
               length: { minimum: 2, maximum: 254},
               format: { with: /\A[一-龯ぁ-ゔゞァ-・ヽヾ゛゜ーa-zA-Z]/ },
               uniqueness: true
    validates :email, presence: true,
            format: { with: VALID_EMAIL_REGEX, message: "Email invalid" },
            uniqueness: { case_sensitive: false },
            length: { minimum: 4, maximum: 254 }   
end
