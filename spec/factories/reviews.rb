FactoryBot.define do
  factory :review do
    user { nil }
    spot { nil }
    review_content { "MyText" }
    image { "MyString" }
  end
end
