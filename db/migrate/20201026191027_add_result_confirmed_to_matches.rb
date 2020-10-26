class AddResultConfirmedToMatches < ActiveRecord::Migration[6.0]
  def change
    add_column :matches, :result_confirmed, :boolean, default: false
  end
end
