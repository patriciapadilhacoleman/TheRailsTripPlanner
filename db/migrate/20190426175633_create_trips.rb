class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string "name"
      t.string "name"
      t.date "beg_date"
      t.date "end_date"
      t.float "budget"

      t.timestamps
    end
  end
end
