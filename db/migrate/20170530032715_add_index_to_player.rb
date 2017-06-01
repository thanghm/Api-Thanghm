class AddIndexToPlayer < ActiveRecord::Migration
  def change
  	add_index :players, :player_name
  end
end
