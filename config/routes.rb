Rails.application.routes.draw do
  root "sessions#new"
  post "/" => "sessions#create"
  get "sessions" => "sessions#new"
  post "sessions" => "sessions#create"
  get "signup" => "signup#new"
  post "signup" => "signup#create"
  get "users" => "users#index"
  get "exit" => "sessions#destroy"
  get "home" => "homes#new"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
