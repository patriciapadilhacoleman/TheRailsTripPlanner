class CreateDays < ActiveRecord::Migration[5.2]
  def change
    create_table :days do |t|
      t.date "date"
      t.string "location"
      t.integer "trip_id"
      t.integer "lodging_id"
      t.timestamps
    end
  end
end
