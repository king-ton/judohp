class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :member_number
      t.date :entry
      t.date :exit
      t.date :entry_federation
      t.date :exit_federation
      t.integer :person_id
      t.integer :dad_id
      t.integer :mum_id

      t.timestamps
    end
    
    add_index :members, :member_number
    add_index :members, :person_id
  end
end
