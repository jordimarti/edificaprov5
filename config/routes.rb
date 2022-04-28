Rails.application.routes.draw do
  resources :pages
  get 'channel/:channel_id/library', to: 'channels#library', as: :library
  resources :library_items
  resources :library_folders
  get 'course_items/category'
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
  get 'communities/list'
  resources :communities
  get 'courses/info'
  get 'courses/list'
  resources :courses
  resources :webhooks, only: [:create]
  get 'articles/list'
  resources :articles
  get 'videos/list'
  resources :videos
  resources :channels
  get 'account_affiliations/info'
  get 'account_affiliations/become_admin'
  resources :account_affiliations
  get 'accounts/switch'
  get 'accounts/select'
  get 'accounts/manage'
  get 'accounts/user_info'
  get 'accounts/new_affiliation'
  get 'accounts/members'
  get 'accounts/confirmed'
  get 'accounts/:id/configuration', to: 'accounts#configuration', as: :account_configuration
  resources :accounts do
    collection do
      post :search
    end
  end
  devise_for :users
  get 'home/index'
  root to: "home#index"
end
