require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  test "derived wins equal scraped wins" do
    Player.all.each do |player|
      assert_equal(player.wins, player.player_wins)
    end
  end

  test "derived losses equal scraped losses" do
    Player.all.each do |player|
      assert_equal(player.losses, player.player_losses)
    end
  end

  test "derived draws equal scraped draws" do
    Player.all.each do |player|
      assert_equal(player.draws, player.player_draws)
    end
  end

  test "derived goals_for equal scraped goals_for" do
    Player.all.each do |player|
      assert_equal(player.goals_for, player.player_goals_for)
    end
  end

  test "derived goals_against equal scraped against" do
    Player.all.each do |player|
      assert_equal(player.goals_against, player.player_goals_against)
    end
  end

end
