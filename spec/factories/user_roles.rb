FactoryGirl.define do
  factory :user_role do
    title {FFaker::Company.position}
  end
end
