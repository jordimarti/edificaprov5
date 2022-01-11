Rails.application.routes.draw do
  resources :course_items
  resources :question_comments do
    resource :question_comment_votes, only: :show
  end
  resources :questions
  resources :lesson_comments
  resources :lessons
  resources :community_comments do
    resource :community_comment_votes, only: :show
  end
  resources :article_comments do
    resource :article_comment_votes, only: :show
  end
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
