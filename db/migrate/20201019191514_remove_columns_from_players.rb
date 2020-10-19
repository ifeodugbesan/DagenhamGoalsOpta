class RemoveColumnsFromPlayers < ActiveRecord::Migration[6.0]
  def change
    remove_column :players, :name, :string
    remove_column :players, :photo, :string
  end
end
