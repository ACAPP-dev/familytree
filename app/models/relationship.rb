class Relationship < ActiveRecord::Base
    
    belongs_to :familymember
    belongs_to :related_familymember, class_name: "Familymember"

end