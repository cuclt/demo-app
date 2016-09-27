Rails.application.routes.draw do
  root "static_pages#home"
  get "signup" => "users#new"
  get "login" => "user#new"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :microposts, only: [:create, :show, :destroy]
  resources :comments, only: [:create]
  resources :relationships, only: [:create, :destroy]

end
