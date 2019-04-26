class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string "dep_airport"
      t.datetime "dep_time"
      t.string "arr_airport"
      t.datetime "arr_time"
      t.float "price"
      t.string "airline"
      t.string "reservation"
      t.integer "trip_id"

      t.timestamps
    end
  end
end
