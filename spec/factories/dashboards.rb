FactoryGirl.define do
  factory :dashboard do
    title FFaker::Company.catch_phrase
    association :organization 
    image "http://www.imageurl.com/image.jpg"
  end
end
