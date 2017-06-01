require 'rails_helper'

describe "User" do
	describe "new" do
		let(:user) { FactoryGirl.create(:user)}
		it "is valid" do 
			expect(user).to be_valid
		end
	end
end 