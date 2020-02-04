class Familymember < ActiveRecord::Base

    belongs_to :family
    has_many :relationships
    has_many :related_family_members, class_name: "Relationship"
    
end