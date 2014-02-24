require 'faker'

FactoryGirl.define do
  factory :matter do |f|
    f.description { Faker::Lorem.sentence }
    sequence(:number) { |number| number }
  end
end
