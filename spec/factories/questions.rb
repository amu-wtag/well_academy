FactoryBot.define do
  factory :question do
    content { "What is the capital of France?" }
    marks { 5 }
    quiz

    created_at { Time.current }
    updated_at { Time.current }
  end
end
