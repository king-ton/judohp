class CreateAgeClasses < ActiveRecord::Migration
  def change
    create_table :age_classes do |t|
      t.string :name
      t.integer :min_age
      t.integer :max_age

      t.timestamps
    end
  end
end
