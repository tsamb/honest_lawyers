FactoryGirl.define do
  factory :user do
    name 'John'
    sequence(:email) { |number| "user#{number}@blah.com" }
    password '123456'
    password_confirmation '123456'
    # admin false
  end
end

