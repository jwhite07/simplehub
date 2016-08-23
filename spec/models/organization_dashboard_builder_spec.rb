require 'rails_helper'

RSpec.describe Organization::DashboardBuilder do
  describe "create_default_dashboards" do
    before(:each) do 
      @org = FactoryGirl.create :organization
      @builder = Organization::DashboardBuilder.new(@org)
    end
    it "creates 3 dashboards and associates them with the organization" do
      @builder.create_default_dashboards
      expect(@org.dashboards.count).to eq(3)
    end
  end
  
end