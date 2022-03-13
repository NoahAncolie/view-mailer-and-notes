Rails.application.routes.draw do
  get 'users/index'
  devise_for :users
  root 'emails#index'
  resources :notes, only: [:index, :create, :update, :destroy]
  resources :emails
  resources :messages, only: [:create, :index, :show]
  resources :users, only: [:index, :create, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
