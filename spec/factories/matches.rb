require 'faker'
FactoryGirl.define do
  factory :match do |t|
    t.match_code {Faker::Address.postcode}
    t.home_player_id {Faker::Number.digit}
    t.away_player_id {Faker::Number.digit}
    t.home_player_score {Faker::Number.digit}
    t.away_player_score {Faker::Number.digit}
    t.venue {Faker::Address.city}
    t.datetime {Time.now}
    t.date {Time.now}
    t.status {1}
  end
end
