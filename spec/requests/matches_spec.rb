require 'rails_helper'

describe "Matches" do
	before { FactoryGirl.create_list(:match, 10)}
	before { FactoryGirl.create_list(:player, 4)}
	before { FactoryGirl.create_list(:season, 3)}

  describe "GET /matches" do
    let(:api_key){ FactoryGirl.create(:api_key) }
    let(:user) {FactoryGirl.create(:user)}
    let(:player) {FactoryGirl.create :player}
    let(:season) {FactoryGirl.create :season}

    it "seach_matches" do
      user.ensure_authentication_token!
      get "/api/v1/matches/seach_matches", ({season_name: season.name, player_name: player.player_name}), { 'Apikey' => api_key.access_token, 'UserToken' => user.authentication_token }
      expect(response.to_a[0]).to eq 200
    end
  end
end