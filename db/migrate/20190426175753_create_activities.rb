class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string "name"
      t.string "contact"
      t.string "phone"
      t.string 'email'
      t.string 'web'
      t.string "street_address"
      t.string "city"
      t.string "state"
      t.string "zip"
      t.float "cost"
      t.integer "day_id"
      t.timestamps
    end
  end
end
