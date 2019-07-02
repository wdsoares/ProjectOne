Rails.application.routes.draw do

  root "sessions#new"
  post "/" => "sessions#create"
  get "sessions" => "sessions#new"
  post "sessions" => "sessions#create"
  get "signup" => "signup#new"
  post "signup" => "signup#create"
  get "endereco" => "endereco#new"
  post "endereco" => "endereco#create"
  get "exit" => "sessions#destroy"
  get "home" => "homes#new"
  get "vender" => "produtos#new"
  post "vender" => "produtos#create"
  get "anuncios" => "produtos#index"
  delete "produto" => "produtos#destroy"
  get "admin" => "homes#index"
  get "forgotpwd" => "forgotpwds#new"
  post "forgotpwd" => "forgotpwds#create"
  get "comprar" => "compras#new"
  get "busca" => "compras#index"
  put "comprar" => "compras#nova"
  get "detalhes" => "produtos#show"
  get "denuncia" => "denuncia#new"
  post "denuncia" => "denuncia#create"
  post "cancelar" => "produtos#edit"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
