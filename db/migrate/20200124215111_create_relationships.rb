class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.string :relation_type
      t.integer :familymember_id
      t.integer :related_familymember_id
      #t.belongs_to :related_familymember, :class_name => "Familymember"
      t.string :description
    end
  end
end
