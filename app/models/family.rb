class Family < ActiveRecord::Base

    has_many :familymembers
    has_many :user_families
    has_many :users, through: :user_families

    has_secure_password

    validates :surname, :family_code, presence: true
    validates :family_code, uniqueness: true

end