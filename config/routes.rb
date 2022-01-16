Rails.application.routes.draw do
  get 'channel/:channel_id/library', to: 'channels#library', as: :library
  resources :library_items
  resources :library_folders
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
  resources :articles
  resources :videos
  resources :channels
  get 'accounts/switch'
  get 'accounts/select'
  get 'accounts/manage'
  get 'accounts/user_info'
  get 'accounts/new_affiliation'
  resources :accounts do
    collection do
      post :search
    end
  end
  devise_for :users
  get 'home/index'
  root to: "home#index"
end
