class TableFamilymember < ActiveRecord::Migration[5.2]
  def change
    create_table :familymembers do |t|
      t.string :first_name
      t.string :last_name
      t.string :married_last_name
      t.string :gender
      t.string :birth_date
      t.string :death_date
      t.string :home_town
      #t.string :photo1
      #t.string :photo2
      #t.string :story
      t.integer :family_id
    end
  end
end
