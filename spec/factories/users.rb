require 'factory_girl'

FactoryGirl.define do
  factory :user do
    provider "google"
    sequence(:uid) { |n| n }
    sequence(:name) { |n| "foobington#{n}" }
    sequence(:email) { |n| "foobington#{n}@gmail.com" }
  end
end
