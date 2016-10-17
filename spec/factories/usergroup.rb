require 'factory_girl_rails'

FactoryGirl.define do
  factory :usergroup do
    sequence(:name) { |n| "testgroup#{n}"}
  end
end
