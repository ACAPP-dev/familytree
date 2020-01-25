class FamilymemberRelationship < ActiveRecord::Base

    belongs_to :familymember
    belongs_to :relationship

end