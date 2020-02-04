class CreateUsersfamilies < ActiveRecord::Migration[5.2]
  def change
    create_table :user_families do |t|
      t.integer :user_id
      t.integer :family_id
    end
  end
end
