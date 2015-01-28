Rails.application.routes.draw do
  devise_for :users
  resources :groups
  
  root 'static_pages#index'
  get '/static_pages', to: 'static_pages#index'
  get '/groups/:id/join_group', to: 'groups#add_user'
  post '/questions/:id/create_right_answer', to: 'static_pages#create_right_answer'
  post '/questions/:id/create_wrong_answer', to: 'static_pages#create_wrong_answer'
end