class User < ActiveRecord::Base
    has_many :user_families
    has_many :families, through: :user_families

    has_secure_password
    
end