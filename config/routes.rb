Rails.application.routes.draw do
  root to: 'rooms#index'
  devise_for :users
  resources :rooms, only: [:new, :create, :index]
end