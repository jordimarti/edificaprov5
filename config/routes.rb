Rails.application.routes.draw do
  get 'accounts/switch'
  get 'accounts/select'
  resources :articles
  resources :videos
  resources :channels
  resources :accounts
  devise_for :users
  get 'home/index'
  root to: "home#index"
end
