class Family < ActiveRecord::Base

    has_many :familymembers

    def self.show_it
        puts Family.all
        puts Familymember.all
        puts Relationship.all
        puts FamilymemberRelationship.all
    end
end