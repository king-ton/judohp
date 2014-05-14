class CreateCompetitionTemplates < ActiveRecord::Migration
  def change
    create_table :competition_templates do |t|
      t.string :title
      t.string :short_name
      t.integer :venue_id

      t.timestamps
    end
  end
end
