class CreateMatchGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :match_goals do |t|
      t.references :team, null: false, foreign_key: true
      t.references :goal, null: false, foreign_key: true
      t.references :assist, null: false, foreign_key: true
      t.references :match, null: false, foreign_key: true

      t.timestamps
    end
  end
end
