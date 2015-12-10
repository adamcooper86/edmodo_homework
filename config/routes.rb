Rails.application.routes.draw do

  root 'welcome#index'

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create', as: 'session'
  match 'logout', to: 'sessions#destroy', as: 'logout', via: [:get, :delete]

  resources :students, only: [:show]
  resources :homeworks, only: [:edit]
end
