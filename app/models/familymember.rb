class Familymember < ActiveRecord::Base

    belongs_to :families, foreign_key: "family_id", class_name: "Family"
    has_and_belongs_to_many :relationships
end