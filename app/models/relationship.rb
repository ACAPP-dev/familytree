class Relationship < ActiveRecord::Base
    #has_many :familyjoins
    #has_many :familymembers, through: :familyjoins
    #belongs_to :dad, through: :familyjoins
    #belongs_to :mom, through: :familyjoins
    #belongs_to :familymember, foreign_key: "dad_id"
    #belongs_to :familymember, foreign_key: "mom_id"
    belongs_to :familymember
    belongs_to :related_familymember, class_name: "Familymember"#, "foreign_key: "related_familymember_id"

end