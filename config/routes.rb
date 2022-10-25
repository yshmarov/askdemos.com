Rails.application.routes.draw do
  devise_for :users
  get 'pricing', to: 'static_pages#pricing'
  get 'terms', to: 'static_pages#terms'
  get 'privacy', to: 'static_pages#privacy'
  root "static_pages#landing_page"
end
