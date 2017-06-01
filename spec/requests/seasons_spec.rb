require 'rails_helper'
require 'csv'

describe "Seasons" do
  describe "POST /seasons" do

  	let(:api_key){ FactoryGirl.create(:api_key) }
    let(:user) {FactoryGirl.create(:user)}

    it "csv" do
      user.ensure_authentication_token!
      reader = Tempfile.new('tournament 10 ball.csv')
      reader << Rails.root.join('tournament 10 ball.csv')
      reader.rewind
      params = { 'csv[][file]' => Rack::Test::UploadedFile.new(reader, 'text/csv')}
      post "/api/v1/seasons/csv", params, { 'Apikey' => api_key.access_token, 'UserToken' => user.authentication_token }
      expect(response.to_a[0]).to eq 201
    end
  end
end