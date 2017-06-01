require 'rails_helper'

describe "Api_key" do
	let(:api_key) {FactoryGirl.create :api_key}
	it "is valid" do 
		expect(api_key).to be_valid
	end
end