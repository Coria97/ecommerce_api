# Rails.application.config.middleware.insert_before 0, Rack::Cors do
#  allow do
#    origins 'http://localhost:3000'
#    resource(
#      '*',
#      headers: :any,
#      expose: ['access-token', 'expiry', 'token-type', 'Authorization'],
#      methods: [:get, :patch, :put, :delete, :post, :options, :show]
#    )
#  end
#end

Rails.application.config.middleware.insert_before 0, Rack::Cors do 
  allow do
   origins 'http://localhost:3000'
   resource '*',
            headers: :any,
            expose: ['access-token', 'expiry', 'token-type', 'Authorization'],
            methods: %i[get post put patch delete head options]
  end
end