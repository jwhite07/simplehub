require 'rails_helper'

RSpec.describe IntegrationDefinition, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:integration_definition)).to be_valid
  end
end
