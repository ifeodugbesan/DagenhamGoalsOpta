class CreateAssists < ActiveRecord::Migration[6.0]
  def change
    create_table :assists do |t|
      t.references :player, null: false, foreign_key: true

      t.timestamps
    end
  end
end
