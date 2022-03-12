Rails.application.routes.draw do
  devise_for :users
  root 'emails#index'
  resources :notes, only: [:index, :create, :update, :destroy]
  resources :emails
  resources :messages, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
