FactoryBot.define do
  factory :cart_item do
    cart
    product
    quantity { Faker::Number.positive }
  end
end
