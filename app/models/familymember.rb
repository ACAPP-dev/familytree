class Familymember < ActiveRecord::Base

    belongs_to :family
    has_many :relationships
    has_many :related_familymembers, class_name: "Relationship"

    validates :first_name, :last_name, :gender, presence: true
end