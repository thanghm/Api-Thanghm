require 'rails_helper'

describe "Group" do
	describe "new" do
		let(:group) { FactoryGirl.create(:group)}
		it "is valid" do 
			expect(group).to be_valid
		end
	end
end
