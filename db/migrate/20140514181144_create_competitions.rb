class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.string :title
      t.date :start_date
      t.date :end_date
      t.integer :venue_id
      t.integer :competition_template_id

      t.timestamps
    end
  end
end
