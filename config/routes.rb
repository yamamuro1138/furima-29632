Rails.application.routes.draw do
  devise_for :users
  get 'users', to: 'users#index'
  resources :users, only: [:edit, :update]
end
