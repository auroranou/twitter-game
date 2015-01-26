Rails.application.routes.draw do
  devise_for :users
  resources :groups
  root 'groups#index'
  # root 'static_pages#index'
  get '/groups/:id/join_group', to: 'groups#add_user'
end