class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.integer :familymember_id
      t.string :relation_type
      t.string :description
      t.belongs_to :related_familymember, :class_name => "Familymember"
      #t.integer :dad_id
      #t.integer :mom_id
    end
  end
end
