Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
end
