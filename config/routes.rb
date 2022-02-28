Rails.application.routes.draw do
  resources :recipes

  get "/users" => "users#index"
  post "/users" => "users#create"
  get "/users/:id" => "users#show"
  post "/sessions" => "sessions#create"
end

