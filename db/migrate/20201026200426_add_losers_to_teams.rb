class AddLosersToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :losers, :boolean, default: false
  end
end
