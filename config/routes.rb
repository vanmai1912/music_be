Rails.application.routes.draw do
  resources :authors
  resources :singers
  resources :songs
  resources :types
  resources :clients
  root "clients#index"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  namespace :api, defaults: { format: :json } do
    resources :types
    resources :singers
    resources :users
    post 'login' => 'auth#login'
    put 'login' => 'auth#login'
    patch 'login' => 'auth#login'
  end
  
  get '/dashboards', to: 'dashboards#index'
  
end
