Rails.application.routes.draw do
  devise_for :users
  resources :groups
  root 'static_pages#index'
  # root 'static_pages#index'
  get '/groups/:id/join_group', to: 'groups#add_user'
  get '/questions/:id/create_right_answer', to: 'static_pages#create_right_answer'
  get '/questions/:id/create_wrong_answer', to: 'static_pages#create_wrong_answer'
  get '/static_pages', to: 'static_pages#index'
end