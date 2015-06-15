Rails.application.routes.draw do
  get 'pages/home'
  root 'pages#home'

  get 'dashboard/index'

  resources :users, only: [ :new, :create ]
end
