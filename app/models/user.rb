class User < ApplicationRecord
    has_many :projects
    has_many :translations, through: :projects
    has_many :words
    has_many :comments, through: :translations
    has_secure_password

    validates :name, presence: true,
               length: { minimum: 3, maximum: 254},
               format: { with: => /[一-龯ぁ-ゔゞァ-・ヽヾ゛゜ーa-zA-Z]/ },
               uniqueness: true
    validates :email, presence: true,
            format: { with: /^(.+)@(.+)$/, message: "Email invalid"  },
            uniqueness: { case_sensitive: false },
            length: { minimum: 4, maximum: 254 }   
end
