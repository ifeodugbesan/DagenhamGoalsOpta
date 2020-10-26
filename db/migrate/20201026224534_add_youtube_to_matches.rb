class AddYoutubeToMatches < ActiveRecord::Migration[6.0]
  def change
    add_column :matches, :youtube, :string
  end
end
