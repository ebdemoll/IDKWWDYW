require 'factory_girl'

FactoryGirl.define do
  factory :user do
    provider "google"
    sequence(:uid) { |n| n }
    sequence(:name) { |n| "foobington#{n}" }
  end
end
