class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :person_id
      t.string :name
      t.string :number

      t.timestamps
    end
    add_index :contacts, :person_id
  end
end
