class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :street
      t.integer :zip
      t.string :city

      t.timestamps
    end
  end
end
