require 'rails_helper'

describe "Season" do
	describe "new" do
		let(:season) { FactoryGirl.create(:season)}
		it "is valid" do 
			expect(season).to be_valid
		end
	end
end
