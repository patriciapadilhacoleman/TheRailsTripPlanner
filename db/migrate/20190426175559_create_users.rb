class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string "username"
      t.string "password_digest"
      t.string "first_name"
      t.string "last_name"
      t.string "dob"
      t.string "home_airport"
      t.string "phone"
      t.string 'email'
      t.string "street_address"
      t.string "city"
      t.string "state"
      t.string "zip"
      t.timestamps
    end
  end
end
