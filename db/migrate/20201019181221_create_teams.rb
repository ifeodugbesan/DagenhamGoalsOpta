class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.boolean :home
      t.string :captain
      t.references :match, null: false, foreign_key: true

      t.timestamps
    end
  end
end
