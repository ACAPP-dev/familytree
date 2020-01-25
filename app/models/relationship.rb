class Relationship < ActiveRecord::Base
    has_many :familyjoins
    has_many :familymembers, through: :familyjoins
    belongs_to :familymember, foreign_key: "dad_id"
    belongs_to :familymember, foreign_key: "mom_id"
end