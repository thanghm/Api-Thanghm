require 'rails_helper'

describe "Player" do
	let(:player) {FactoryGirl.create :player}
	describe "new" do
		it "is valid" do 
			expect(player).to be_valid
		end
		before { FactoryGirl.create_list(:match, 10)}
		context "player_win" do
			it {expect(player.player_wins).to eq(player.player_wins)}
		end
		context "player_draws" do
			it {expect(player.player_draws).to eq(player.player_draws)}
		end
		context "player_losses" do
			it {expect(player.player_losses).to eq(player.player_losses)}
		end
	end
end
