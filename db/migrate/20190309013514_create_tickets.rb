class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|
      t.string :dep_airport
      t.string :dep_time
      t.string :arr_airport
      t.string :arr_time
      t.string :price
      t.string :airline
      t.string :reservation

      t.references :trip, foreign_key: true
      
    end
  end
end
