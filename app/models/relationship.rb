class Relationship < ActiveRecord::Base
    has_many :familyjoins
    has_many :familymembers, through: :familyjoins
end