Rails.application.routes.draw do
  root to: 'rooms#index'
  devise_for :users

  get "messages/index2" => "messages#index2"
  resources :rooms, only: [:new, :create, :index, :destroy] do
    resources :messages, only: [:index, :create]
  end
  resources :users, only: [:edit, :update, :show]
end