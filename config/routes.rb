Rails.application.routes.draw do
  devise_for :users
  resources :groups
  root 'static_pages#index'
end