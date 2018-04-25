FactoryBot.define do
  factory :sale do
    purchaser_name Faker::Name.name
    item_description Faker::Food.dish
    item_price { rand(10..30) }
    purchase_count { rand(1..5) }
    merchant_address Faker::Address.street_address
    merchant_name Faker::Name.name
  end
end
