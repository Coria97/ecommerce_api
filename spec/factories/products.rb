FactoryBot.define do
  factory :product do
    active { true }
    description { Faker::Lorem.paragraph }
    dimensions { '2m' }
    name { Faker::Commerce.product_name }
    price { Faker::Commerce.price(range: 50.0..300.0) }
    sku { Faker::Alphanumeric.alphanumeric(number: 10).upcase }
    stock_quantity { Faker::Number.between(from: 1, to: 100) }
    weight { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
  end
end
