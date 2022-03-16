Rails.application.routes.draw do
  resources :recipes

  get "/users" => "users#index"
  post "/users" => "users#create"
  get "/users/:id" => "users#show"
  post "/sessions" => "sessions#create"

  get "/messages" => "messages#index"
  post "/messages" => "messages#create"
  
  get "/*path" => proc { [200, {}, [ActionView::Base.new.render(file: 'public/index.html')]] }
end

