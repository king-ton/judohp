class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :last_name
      t.string :first_name
      t.boolean :gender
      t.date :birth_date
      t.string :birth_place
      t.string :street
      t.integer :zip
      t.string :city
      t.integer :user_id

      t.timestamps
    end
  end
end
