class CreateJoinCompetitionsAgeClasses < ActiveRecord::Migration
  def change
    create_table :competitions_age_classes, id: false do |t|
      t.integer :competition_id
      t.integer :age_class_id
    end
  end
end
