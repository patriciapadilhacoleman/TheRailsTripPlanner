class CreateLodgings < ActiveRecord::Migration[5.2]
  def change
    create_table :lodgings do |t|
      t.string :name
      t.string :phone
      t.string :web
      t.string :email
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.float :nightly_cost

      t.timestamps
    end
  end
end
