class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :username
      t.string :password_digest
      t.string :created_time_stamp
      t.boolean :enabled
      t.string :updated_time_stamp
    end
  end
end
