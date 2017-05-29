class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :player_name
      t.string :alternate_name
      t.integer :group_id
      t.integer :wins
      t.integer :draws
      t.integer :losses
      t.integer :goals_for
      t.integer :goals_against
      t.boolean :knocked_out
      t.integer :season_id

      t.timestamps null: false
    end
  end
end
