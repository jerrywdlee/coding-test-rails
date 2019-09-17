FactoryBot.define do
  factory :address do
    phone { "090-1234-5678" }
    prefecture_id { 13 }
    city { "test_city" }
    customer
  end
end
