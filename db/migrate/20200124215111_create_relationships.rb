class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.string :relation_type
      t.string :description
      #t.integer :dad_id
      #t.integer :mom_id
    end
  end
end
