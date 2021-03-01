Rails.application.routes.draw do
  root to: 'rooms#index'
  devise_for :users

  get "messages/index2" => "messages#index2"
  resources :rooms, only: [:new, :create, :index] do
    resources :messages, only: [:index, :create]
  end
end