class AddReferencesToPlayers < ActiveRecord::Migration[6.0]
  def change
    add_reference :players, :user, null: false, foreign_key: true
    add_reference :players, :team, null: false, foreign_key: true
  end
end
