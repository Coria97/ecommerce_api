## Products
### Product Actives
FactoryBot.create_list(:product, 3)
### Product Inactive
FactoryBot.create(:product, active: false)

## Consumers
FactoryBot.create(:consumer, email: 'la_bestia_merentiel@boca.com', password: '12345678')
