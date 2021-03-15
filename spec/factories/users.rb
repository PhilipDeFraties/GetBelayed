FactoryBot.define do
  factory :user do
    first_name { Faker::Name.unique.name }
    last_name { Faker::Name.unique.name }
    email { Faker::Internet.email }
    gender { Faker::Gender.binary_type }
  end
end
