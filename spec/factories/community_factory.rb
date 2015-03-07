FactoryGirl.define do
  factory :community do
    name { Faker::Company.name }
    description { Faker::Company.catch_phrase }
  end
end

