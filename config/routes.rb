Rails.application.routes.draw do
  devise_for :users
  get 'pages/home'
  root 'pages#home'

  get 'dashboard/index'

  resources :users, only: [ :new, :create ]
end
