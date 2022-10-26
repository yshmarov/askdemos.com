Rails.application.routes.draw do
  resources :messages
  resources :inboxes
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  get 'pricing', to: 'static_pages#pricing'
  get 'terms', to: 'static_pages#terms'
  get 'privacy', to: 'static_pages#privacy'
  root "static_pages#landing_page"
end
