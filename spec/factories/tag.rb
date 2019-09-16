FactoryBot.define do
  factory :tag do
    name { "test_tag" }

    trait :with_items do
      after(:build) do |tag|
        tag.items << FactoryBot.build(:item, name: "test_item-1")
        tag.items << FactoryBot.build(:item, name: "test_item-2")
      end
    end
  end
end
