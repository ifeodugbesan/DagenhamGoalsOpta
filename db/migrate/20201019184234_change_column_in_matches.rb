class ChangeColumnInMatches < ActiveRecord::Migration[6.0]
  def change
    change_column :matches, :date, :date
  end
end
