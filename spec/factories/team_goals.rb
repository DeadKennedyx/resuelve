FactoryBot.define do
  factory :team_goal do
    association :team, factory: :team
    required_goals { {'A'=>5, 'B'=>10, 'C'=>15, 'Cuauh'=>20} }
  end
end
