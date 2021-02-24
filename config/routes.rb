Rails.application.routes.draw do
  root to: 'messagse#index'
  devise_for :users
  resources :rooms, only: [:new, :create]
end