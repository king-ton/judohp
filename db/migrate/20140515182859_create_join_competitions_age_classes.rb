class CreateJoinCompetitionsAgeClasses < ActiveRecord::Migration
  def change
    create_table :age_classes_competitions, id: false do |t|
      t.integer :age_class_id
      t.integer :competition_id
    end
  end
end
