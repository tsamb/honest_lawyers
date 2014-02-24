require 'faker'

FactoryGirl.define do
  factory :client do |f|
    f.name { Faker::Company.name }
    f.number { Faker::PhoneNumber.phone_number }
  end
end
