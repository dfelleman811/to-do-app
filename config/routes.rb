Rails.application.routes.draw do
  root "sessions#new" # doesn't feel like the best root path. But if it's home page the way i have errors set up - you get a error that you need to login to see your todos before you've even tried to log in.

  resources :to_dos
  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :destroy]

  # get '/login' => "sessions#new"
  # post '/login' => "sessions#create"
  # get '/logout' => "sessions#destroy"
end
