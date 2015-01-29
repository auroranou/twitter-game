Rails.application.routes.draw do
  devise_for :users, :path => 'accounts'
  resources :groups
  resources :questions, only: [:index, :create_right_answer, :create_wrong_answer]
  resources :users, only: :index
  
  root 'static_pages#index'
  get '/static_pages', to: 'static_pages#index'
  get '/groups/:id/join_group', to: 'groups#add_user'
  post '/questions/:id/create_right_answer', to: 'questions#create_right_answer'
  post '/questions/:id/create_wrong_answer', to: 'questions#create_wrong_answer'

end