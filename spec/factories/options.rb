FactoryBot.define do
  factory :option do
    option_text { "Sample option text" }
    is_correct { false }
    question
  end
end
