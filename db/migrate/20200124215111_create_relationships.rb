class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.string :relation_type
      t.integer :familymember_id_from
      t.integer :familymember_id_to
      t.string :description
    end
  end
end
