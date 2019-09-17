FactoryBot.define do
  factory :review do
    score { 5 }
    text { "test_text" }
    item
    customer
  end
end
