class  CreateFamilyjoins < ActiveRecord::Migration[5.2]
  def change
    #create_join_table :familymembers, :relationships do |t|
     #t.index :familymember_id
     #t.index :relationship_id

     create_table :familyjoins do |t|
      t.belongs_to :familymember
      t.belongs_to :relationship
      #t.belongs_to :dad, :class_name => "Familymember"
      #t.belongs_to :mom, :class_name => "Familymember"
    end
  end
end
