class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :name
      t.string :description
      t.string :contact_phone
      t.string :contact_email
      t.string :web
      t.float :cost

      t.references :day, foreign_key: true

      t.timestamps
    end
  end
end
