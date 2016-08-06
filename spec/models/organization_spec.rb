require 'rails_helper'

RSpec.describe Organization, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:organization)).to be_valid
  end
  it "is invalid without a name" do
    expect(FactoryGirl.build(:organization, name: nil)).to be_invalid
  end
end
