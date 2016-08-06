require 'ffaker'
FactoryGirl.define do
  factory :user do
    email {FFaker::Internet.email}
    first_name {FFaker::Name.first_name}
    last_name {FFaker::Name.last_name}
    
    password 'password'
    password_confirmation 'password'
    association :user_role
    association :organization
  end
end
