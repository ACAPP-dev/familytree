class Familymember < ActiveRecord::Base

    belongs_to :family #, foreign_key: "family_id" #, class_name: "Family"

    has_many :relationships
end