class Family < ActiveRecord::Base

    has_many :familymembers
    has_many :user_families
    has_many :users, through: :user_families

end