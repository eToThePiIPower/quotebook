FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" }
    sequence(:username) { |n| "user#{n}" }
    password 'password'

    after :build do |user|
      build :profile, user: user
    end
  end
end
