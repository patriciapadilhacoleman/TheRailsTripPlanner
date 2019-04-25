class CreateDays < ActiveRecord::Migration[5.1]
  def change
    create_table :days do |t|
      t.date :date
      t.string:description
      t.integer :trip_id
    end
  end
end
