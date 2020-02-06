class User < ActiveRecord::Base
    has_many :user_families
    has_many :families, through: :user_families

    has_secure_password
    
    validates :first_name, :email, :username, presence: true
    validates :email, :username, uniqueness: true
end