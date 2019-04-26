class CreateLodgings < ActiveRecord::Migration[5.2]
  def change
    create_table :lodgings do |t|

      t.string "name"
      t.string "contact"
      t.string "phone"
      t.string 'email'
      t.string 'web'
      t.string "street_address"
      t.string "city"
      t.string "state"
      t.string "zip"
      t.string "description"
      t.integer "no_of_guests"
      t.string "cost"
    

      t.timestamps
    end
  end
end
