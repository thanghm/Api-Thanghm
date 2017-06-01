require 'faker'
FactoryGirl.define do
  factory :player do |t|
    t.player_name {Faker::Name.name_with_middle}
  	t.season_id {Faker::Number.digit}
  	t.group_id {Faker::Number.digit}
  	t.wins {Faker::Number.digit}
  	t.draws {Faker::Number.digit}
  	t.losses {Faker::Number.digit}
  	t.goals_for {Faker::Number.digit}
  	t.goals_against {Faker::Number.digit}
  end
end
