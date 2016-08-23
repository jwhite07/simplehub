require 'rails_helper'

RSpec.describe Dashboard, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:dashboard)).to be_valid
  end
  it "is invalid without a title" do
    expect(FactoryGirl.build(:dashboard, title: nil)).to be_invalid
  end
  it "is invalid without an organization" do
    expect(FactoryGirl.build(:dashboard, organization: nil)).to be_invalid
  end
end
