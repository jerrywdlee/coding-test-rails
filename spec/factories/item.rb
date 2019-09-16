FactoryBot.define do
  factory :item do
    name { "test_item" }
    price { 100 }

    trait :with_tags do
      after(:build) do |item|
        item.tags << FactoryBot.build(:tag, name: "test_tag-1")
        item.tags << FactoryBot.build(:tag, name: "test_tag-2")
      end
    end
  end
end
