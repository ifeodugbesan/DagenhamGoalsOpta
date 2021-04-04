class AddSeasonToMatches < ActiveRecord::Migration[6.0]
  def change
    add_column :matches, :season, :integer
  end
end
