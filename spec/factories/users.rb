FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@example.com" } # generates unique emails for each user instance.
    password { "password" }
    name { "Test User" }
    phone { "1234567890" }
    date_joined { Time.now }
    bio { "A test bio" }

    # Define the roles
    trait :student do
      role { 'student' }
    end

    trait :teacher do
      role { 'teacher' }
    end

    trait :admin do
      role { 'admin' }
    end
  end
end
