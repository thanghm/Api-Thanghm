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

    it "empty api_key" do
      post "/api/v1/users/login", nil, { 'Apikey' => '' }
      expect(response.to_a[0]).to eq 403
    end

    it "not authenticated" do
      post "/api/v1/users/login", nil, { 'Apikey' => api_key.access_token }
      expect(response.to_a[0]).to eq 400
    end

    it "login" do
      post "/api/v1/users/login", ({email: user.email, password: user.password}), { 'Apikey' => api_key.access_token }
      expect(response.to_a[0]).to eq 201
    end

    it "logout" do
      user.ensure_authentication_token!
      post "/api/v1/users/logout", { 'Apikey' => api_key.access_token }
      expect(response.to_a[0]).to eq 403
    end

    it "forgot_password" do
      get "/api/v1/users/forgot_password", {email: user.email}, { 'Apikey' => api_key.access_token }
      p response.to_a
      expect(response.to_a[0]).to eq 500
    end
  end
end
