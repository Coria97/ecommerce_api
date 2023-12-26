Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:3000'
    resource '*',
            headers:  :any,
            expose: ['access-token', 'expiry', 'token-type', 'Authorization', 'X-CSRF-Token'],
            methods:  %i[get post put patch delete head options]
  end
end
