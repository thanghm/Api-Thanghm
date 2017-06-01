require 'rails_helper'

describe "Players" do
  before { FactoryGirl.create_list(:match, 10)}

  describe "GET /players" do
    let(:api_key){ FactoryGirl.create(:api_key) }
    let(:user) {FactoryGirl.create(:user)}
    let(:player) {FactoryGirl.create :player}

    it "empty api_key" do
      user.ensure_authentication_token!
      get "/api/v1/players/search", nil, { 'Apikey' => '', 'UserToken' => user.authentication_token }
      expect(response.to_a[0]).to eq 403
    end

    it "not authenticated" do
      get "/api/v1/players/search", nil, { 'Apikey' => api_key.access_token, 'UserToken' => '' }
      expect(response.to_a[0]).to eq 200
    end

    it "search" do
      user.ensure_authentication_token!
      get "/api/v1/players/search", ({search_text: player.player_name}), { 'Apikey' => api_key.access_token, 'UserToken' => user.authentication_token }
      expect(response.to_a[0]).to eq 200
    end
  end
end
