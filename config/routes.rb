Rails.application.routes.draw do
  resources :video_comments do
    resource :video_comment_votes, only: :show
  end
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
