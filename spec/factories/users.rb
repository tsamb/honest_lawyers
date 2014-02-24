require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.name { Faker::Name.name }
    sequence(:email) { |number| "user#{number}@blah.com" }
    # f.password { Faker::Internet.password }
    password '123456'
    password_confirmation '123456'
    # admin false
  end
end

