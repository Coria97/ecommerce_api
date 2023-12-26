Rails.application.routes.draw do
  devise_for :user, path: 'api/v1', path_names:
  {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'api/v1/users/sessions',
    registrations: 'api/v1/users/registrations'
  }

  namespace :api do
    namespace :v1 do
      resources :products, only: [:index, :show]
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end

# rubocop:disable Layout/LineLength

# == Route Map
#
#                                   Prefix Verb   URI Pattern                                                                                       Controller#Action
#                         new_user_session GET    /api/v1/login(.:format)                                                                           api/v1/users/sessions#new
#                             user_session POST   /api/v1/login(.:format)                                                                           api/v1/users/sessions#create
#                     destroy_user_session DELETE /api/v1/logout(.:format)                                                                          api/v1/users/sessions#destroy
#                        new_user_password GET    /api/v1/password/new(.:format)                                                                    devise/passwords#new
#                       edit_user_password GET    /api/v1/password/edit(.:format)                                                                   devise/passwords#edit
#                            user_password PATCH  /api/v1/password(.:format)                                                                        devise/passwords#update
#                                          PUT    /api/v1/password(.:format)                                                                        devise/passwords#update
#                                          POST   /api/v1/password(.:format)                                                                        devise/passwords#create
#                 cancel_user_registration GET    /api/v1/signup/cancel(.:format)                                                                   api/v1/users/registrations#cancel
#                    new_user_registration GET    /api/v1/signup/sign_up(.:format)                                                                  api/v1/users/registrations#new
#                   edit_user_registration GET    /api/v1/signup/edit(.:format)                                                                     api/v1/users/registrations#edit
#                        user_registration PATCH  /api/v1/signup(.:format)                                                                          api/v1/users/registrations#update
#                                          PUT    /api/v1/signup(.:format)                                                                          api/v1/users/registrations#update
#                                          DELETE /api/v1/signup(.:format)                                                                          api/v1/users/registrations#destroy
#                                          POST   /api/v1/signup(.:format)                                                                          api/v1/users/registrations#create
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
