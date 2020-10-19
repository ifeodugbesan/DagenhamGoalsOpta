class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.string :title
      t.datetime :date
      t.string :referee

      t.timestamps
    end
  end
end
