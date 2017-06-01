require 'faker'
FactoryGirl.define do
  factory :season do |t|
    t.name {Faker::Name.name}
  end
end
