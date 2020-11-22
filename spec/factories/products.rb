FactoryBot.define do
  factory :product do
    name { "MyString" }
    description { "MyText" }
    composition { "MyText" }
    brand { nil }
    category { nil }
  end
end
