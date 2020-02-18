Rails.application.routes.draw do
  root 'users#new'
  resources :posts do
    resources :comments
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  post '/guest', to: 'guest_sessions#create'
end
