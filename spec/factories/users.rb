FactoryGirl.define do
  factory :user do
    provider 'gmail.com'
    sequence(:uid) { |n| "uid#{n}"}
    sequence(:name) { |n| "testuser#{n}"}
    sequence(:oauth_token) { |n| "80193918#{n}"}
    oauth_expires_at '2016-10-18 20:18:50'
  end
end
