require 'rails_helper'

describe "Match" do
	describe "new" do
		before { FactoryGirl.create_list(:match, 10)}
		before { FactoryGirl.create_list(:player, 4)}
		before { FactoryGirl.create_list(:season, 3)}
		let(:match) {FactoryGirl.create(:match)}
		it "is valid" do 
			expect(match).to be_valid
		end

		context ".all null" do
			it {expect(Match.matchs_search(season_name: '', player_name: '')).to eq(Match.matchs_search(season_name: '', player_name: ''))}
		end

		context ".season_name is null" do
			it {expect(Match.matchs_search(season_name: '', player_name: 'uuuu')).to eq(Match.matchs_search(season_name: '', player_name: 'uuuu'))}
		end

		context ".all present" do
			it {expect(Match.matchs_search(season_name: 'uuuu', player_name: 'uuuu')).to eq(Match.matchs_search(season_name: 'uuuu', player_name: 'uuuu'))}
		end
	end
end
