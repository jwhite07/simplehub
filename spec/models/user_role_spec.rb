require 'rails_helper'

RSpec.describe UserRole, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:user_role)).to be_valid
  end
  it "is invalid without a name" do
    expect(FactoryGirl.build(:user_role, title: nil)).to be_invalid
  end
end
