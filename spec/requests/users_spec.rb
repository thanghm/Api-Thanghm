require 'rails_helper'

describe "Users" do
  describe "GET /users" do
    let(:api_key){ FactoryGirl.create(:api_key) }
    let(:user) {FactoryGirl.create(:user)}

    it "swagger documentation" do
      get "/api/v1/swagger_doc"
      response.status == 200
      json_response = JSON.parse(response.body)
      json_response["apiVersion"] == "v1"
    end

    it "login" do
      post "/api/v1/users/login", ({email: user.email, password: user.password}), { 'Apikey' => api_key.access_token }
      expect(response.to_a[0]).to eq 201
    end
  end
end
