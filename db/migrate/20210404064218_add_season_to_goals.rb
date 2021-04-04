class AddSeasonToGoals < ActiveRecord::Migration[6.0]
  def change
    add_column :goals, :season, :integer
  end
end
