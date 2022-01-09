Rails.application.routes.draw do
  resources :communities
  resources :courses
  resources :webhooks, only: [:create]
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
