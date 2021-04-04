class AddSeasonToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :season, :integer
  end
end
