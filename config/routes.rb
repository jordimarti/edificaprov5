Rails.application.routes.draw do
  get 'dashboard/index'
  get 'dashboard/videos'
  get 'dashboard/articles'
  get 'dashboard/courses'
  get 'dashboard/communities'
  get 'dashboard/billing'
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
