class AddSeasonToAssists < ActiveRecord::Migration[6.0]
  def change
    add_column :assists, :season, :integer
  end
end
