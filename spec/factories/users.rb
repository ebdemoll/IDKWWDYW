require 'factory_girl_rails'

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user_email#{n}@gmail.com"}
    sequence(:first_name) { |n| "first#{n}"}
    sequence(:last_name) { |n| "last#{n}"}
    password "tester_password"
  end
end
