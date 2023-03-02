Rails.application.routes.draw do
  root "to_dos#index"

  resources :to_dos
  resources :users, only: [:new, :create]

  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  get '/logout' => "sessions#destroy"
end
