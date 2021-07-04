Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: [:index, :show]
  resources :relationships, only: [:create, :destroy]
  resources :blogs
  root 'blogs#index'
end
