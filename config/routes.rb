Rails.application.routes.draw do
  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  get 'pricing', to: 'static_pages#pricing'
  get 'terms', to: 'static_pages#terms'
  get 'privacy', to: 'static_pages#privacy'
  root "static_pages#landing_page"

  resources :inboxes do
    resources :messages, module: :inboxes
  end
end
