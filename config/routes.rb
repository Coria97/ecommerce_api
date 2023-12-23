Rails.application.routes.draw do
  devise_for :consumers, path: 'api/v1', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  namespace :api do
    namespace :v1 do
      resources :products, only: [:index, :show]
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end

# == Route Map
#
#                                   Prefix Verb   URI Pattern                                                                                       Controller#Action
#                     new_consumer_session GET    /consumers/sign_in(.:format)                                                                      devise/sessions#new
#                         consumer_session POST   /consumers/sign_in(.:format)                                                                      devise/sessions#create
#                 destroy_consumer_session DELETE /consumers/sign_out(.:format)                                                                     devise/sessions#destroy
#                    new_consumer_password GET    /consumers/password/new(.:format)                                                                 devise/passwords#new
#                   edit_consumer_password GET    /consumers/password/edit(.:format)                                                                devise/passwords#edit
#                        consumer_password PATCH  /consumers/password(.:format)                                                                     devise/passwords#update
#                                          PUT    /consumers/password(.:format)                                                                     devise/passwords#update
#                                          POST   /consumers/password(.:format)                                                                     devise/passwords#create
#             cancel_consumer_registration GET    /consumers/cancel(.:format)                                                                       devise/registrations#cancel
#                new_consumer_registration GET    /consumers/sign_up(.:format)                                                                      devise/registrations#new
#               edit_consumer_registration GET    /consumers/edit(.:format)                                                                         devise/registrations#edit
#                    consumer_registration PATCH  /consumers(.:format)                                                                              devise/registrations#update
#                                          PUT    /consumers(.:format)                                                                              devise/registrations#update
#                                          DELETE /consumers(.:format)                                                                              devise/registrations#destroy
#                                          POST   /consumers(.:format)                                                                              devise/registrations#create
#                          api_v1_products GET    /api/v1/products(.:format)                                                                        api/v1/products#index
#                           api_v1_product GET    /api/v1/products/:id(.:format)                                                                    api/v1/products#show
#                       rails_health_check GET    /up(.:format)                                                                                     rails/health#show
#         turbo_recede_historical_location GET    /recede_historical_location(.:format)                                                             turbo/native/navigation#recede
#         turbo_resume_historical_location GET    /resume_historical_location(.:format)                                                             turbo/native/navigation#resume
#        turbo_refresh_historical_location GET    /refresh_historical_location(.:format)                                                            turbo/native/navigation#refresh
#            rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                           action_mailbox/ingresses/postmark/inbound_emails#create
#               rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                              action_mailbox/ingresses/relay/inbound_emails#create
#            rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                           action_mailbox/ingresses/sendgrid/inbound_emails#create
#      rails_mandrill_inbound_health_check GET    /rails/action_mailbox/mandrill/inbound_emails(.:format)                                           action_mailbox/ingresses/mandrill/inbound_emails#health_check
#            rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                           action_mailbox/ingresses/mandrill/inbound_emails#create
#             rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                                       action_mailbox/ingresses/mailgun/inbound_emails#create
#           rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                          rails/conductor/action_mailbox/inbound_emails#index
#                                          POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                          rails/conductor/action_mailbox/inbound_emails#create
#        new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                                      rails/conductor/action_mailbox/inbound_emails#new
#            rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#show
# new_rails_conductor_inbound_email_source GET    /rails/conductor/action_mailbox/inbound_emails/sources/new(.:format)                              rails/conductor/action_mailbox/inbound_emails/sources#new
#    rails_conductor_inbound_email_sources POST   /rails/conductor/action_mailbox/inbound_emails/sources(.:format)                                  rails/conductor/action_mailbox/inbound_emails/sources#create
#    rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                               rails/conductor/action_mailbox/reroutes#create
# rails_conductor_inbound_email_incinerate POST   /rails/conductor/action_mailbox/:inbound_email_id/incinerate(.:format)                            rails/conductor/action_mailbox/incinerates#create
#                       rails_service_blob GET    /rails/active_storage/blobs/redirect/:signed_id/*filename(.:format)                               active_storage/blobs/redirect#show
#                 rails_service_blob_proxy GET    /rails/active_storage/blobs/proxy/:signed_id/*filename(.:format)                                  active_storage/blobs/proxy#show
#                                          GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                                        active_storage/blobs/redirect#show
#                rails_blob_representation GET    /rails/active_storage/representations/redirect/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations/redirect#show
#          rails_blob_representation_proxy GET    /rails/active_storage/representations/proxy/:signed_blob_id/:variation_key/*filename(.:format)    active_storage/representations/proxy#show
#                                          GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format)          active_storage/representations/redirect#show
#                       rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                                       active_storage/disk#show
#                update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                               active_storage/disk#update
#                     rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                                    active_storage/direct_uploads#create
