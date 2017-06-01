require 'rails_helper'

describe "Players" do
  before { FactoryGirl.create_list(:match, 10)}

  describe "GET /players" do
    let(:api_key){ FactoryGirl.create(:api_key) }
    let(:user) {FactoryGirl.create(:user)}
    let(:player) {FactoryGirl.create :player}

    it "search" do
      user.ensure_authentication_token!
      get "/api/v1/players/search", ({search_text: player.player_name}), { 'Apikey' => api_key.access_token, 'UserToken' => user.authentication_token }
      expect(response.to_a[0]).to eq 200
    end
  end
end
