require 'rails_helper'

RSpec.describe User, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:user)).to be_valid
  end
  it "is invalid without a first_name" do
    expect(FactoryGirl.build(:user, first_name: nil)).to be_invalid
  end
  it "is invalid without a last_name" do
    expect(FactoryGirl.build(:user, last_name: nil)).to be_invalid
  end
  it "is invalid without a company" do
    expect(FactoryGirl.build(:user, organization_id: nil)).to be_invalid
  end
  it "is invalid without a role" do
    expect(FactoryGirl.build(:user, user_role_id: nil)).to be_invalid
  end
  it "is invalid without an email" do
    expect(FactoryGirl.build(:user, email: nil)).to be_invalid

  end
  it "is valid without a phone_number" do
    expect(FactoryGirl.build(:user, phone_number: nil)).to be_valid
  end

  it "is invalid if password does not match confirmation" do
    expect(FactoryGirl.build(:user, password: "password", password_confirmation: "bad_password")).to be_invalid
  end
end
