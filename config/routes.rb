Rails.application.routes.draw do

  root 'welcome#index'

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create', as: 'session'
  match 'logout', to: 'sessions#destroy', as: 'logout', via: [:get, :delete]

  resources :homeworks, only: [:show, :edit]
  resources :submissions, only: [:new, :create]
  resources :users, only: [:show]
end
