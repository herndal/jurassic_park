# == Route Map
#
#                                Prefix Verb   URI Pattern                                                                              Controller#Action
#                             api_cages GET    /api/cages(.:format)                                                                     api/cages#index {:format=>:json}
#                                       POST   /api/cages(.:format)                                                                     api/cages#create {:format=>:json}
#                          new_api_cage GET    /api/cages/new(.:format)                                                                 api/cages#new {:format=>:json}
#                         edit_api_cage GET    /api/cages/:id/edit(.:format)                                                            api/cages#edit {:format=>:json}
#                              api_cage GET    /api/cages/:id(.:format)                                                                 api/cages#show {:format=>:json}
#                                       PATCH  /api/cages/:id(.:format)                                                                 api/cages#update {:format=>:json}
#                                       PUT    /api/cages/:id(.:format)                                                                 api/cages#update {:format=>:json}
#                                       DELETE /api/cages/:id(.:format)                                                                 api/cages#destroy {:format=>:json}
#                         api_dinosaurs GET    /api/dinosaurs(.:format)                                                                 api/dinosaurs#index {:format=>:json}
#                                       POST   /api/dinosaurs(.:format)                                                                 api/dinosaurs#create {:format=>:json}
#                      new_api_dinosaur GET    /api/dinosaurs/new(.:format)                                                             api/dinosaurs#new {:format=>:json}
#                     edit_api_dinosaur GET    /api/dinosaurs/:id/edit(.:format)                                                        api/dinosaurs#edit {:format=>:json}
#                          api_dinosaur GET    /api/dinosaurs/:id(.:format)                                                             api/dinosaurs#show {:format=>:json}
#                                       PATCH  /api/dinosaurs/:id(.:format)                                                             api/dinosaurs#update {:format=>:json}
#                                       PUT    /api/dinosaurs/:id(.:format)                                                             api/dinosaurs#update {:format=>:json}
#                                       DELETE /api/dinosaurs/:id(.:format)                                                             api/dinosaurs#destroy {:format=>:json}
#         rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                  action_mailbox/ingresses/postmark/inbound_emails#create
#            rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                     action_mailbox/ingresses/relay/inbound_emails#create
#         rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                  action_mailbox/ingresses/sendgrid/inbound_emails#create
#   rails_mandrill_inbound_health_check GET    /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#health_check
#         rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                  action_mailbox/ingresses/mandrill/inbound_emails#create
#          rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                              action_mailbox/ingresses/mailgun/inbound_emails#create
#        rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#index
#                                       POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                 rails/conductor/action_mailbox/inbound_emails#create
#     new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                             rails/conductor/action_mailbox/inbound_emails#new
#    edit_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                        rails/conductor/action_mailbox/inbound_emails#edit
#         rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#show
#                                       PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#update
#                                       DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                             rails/conductor/action_mailbox/inbound_emails#destroy
# rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                      rails/conductor/action_mailbox/reroutes#create
#                    rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
#             rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#                    rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
#             update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#                  rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: :json} do
    resources :cages
    resources :dinosaurs
  end
end
