class JoinCreate < ActiveRecord::Migration[5.2]
  def change
    create_table :familymembers_relationships do |t|
      t.integer :familymember_id
      t.integer :relationship_id
    end
  end
end
