class AddPlayerIdGaveUpToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :player_id_gave_up, :integer
  end
end
