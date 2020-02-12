class CreateFamily < ActiveRecord::Migration[5.2]
  def change
    create_table :families do |t|
      t.string :surname
      t.string :description
      #t.string :logo
      #t.string :color
      #t.string :photo
      t.string :family_code
      t.string :password_digest
    end
  end
end
