Rails.application.routes.draw do
  root "sessions#new"

  resources :to_dos
  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  # get '/login' => "sessions#new"
  # post '/login' => "sessions#create"
  # get '/logout' => "sessions#destroy"
end
