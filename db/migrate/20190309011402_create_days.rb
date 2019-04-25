class CreateDays < ActiveRecord::Migration[5.1]
  def change
    create_table :days do |t|
      t.date :date
      t.string:description
      t.integer :trip_id
      t.integer :lodging_id
      t.float :expenses

      t.references :trip, foreign_key: true
      t.references :lodging, foreign_key: true

      t.timestamps

    end
  end
end
