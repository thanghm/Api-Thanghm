class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :match_code
      t.string :venue
      t.datetime :datetime
      t.date :datetime
      t.integer :home_player_id
      t.integer :away_player_id
      t.string :home_player_tbd
      t.string :away_player_tbd
      t.boolean :players_scheduled
      t.integer :home_player_score
      t.integer :away_player_score
      t.integer :status
      t.timestamps null: false
    end
  end
end
