Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :blogs
  root 'blogs#index'
end
