FactoryBot.define do
  factory :player do
    association :team, factory: :team
    name { Faker::Name.name }
    goals { 9 }
    salary { 30000 }
    bonus { 10000 }
    level { "C" }
  end
end
