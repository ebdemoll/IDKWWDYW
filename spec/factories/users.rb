require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "foobington#{n}" }
    sequence(:email) { |n| "foobington#{n}@mails.com" }
    sequence(:password) { |n| "password#{n}" }
  end
end
