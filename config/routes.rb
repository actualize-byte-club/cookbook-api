Rails.application.routes.draw do
  resources :recipes

  get "/users" => "users#index"
  post "/users" => "users#create"
  get "/users/:id" => "users#show"
  post "/sessions" => "sessions#create"
  
  get "/*path" => proc { [200, {}, [ActionView::Base.new.render(file: 'public/index.html')]] }
end

