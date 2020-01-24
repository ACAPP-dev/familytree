class Relationship < ActiveRecord::Base

    has_and_belongs_to_many :familymembers
end