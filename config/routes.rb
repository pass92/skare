Skare::Application.routes.draw do
  post "users/create" => "users#create"
  resources :sessions, only: [:new, :create, :destroy]
  get "welcome" => "welcome#index"
  get "sessions/destroy" => "sessions#destroy"
  get "user" => "users#show"
  get "user/destroy" => "users#destroy"
  get "users" => "users#index"
  
  #posts routes
  post "post/create" => "posts#create"
  get "posts" => "posts#index"
  get "posts/drop" => "posts#drop"
  get "posts/show" => "posts#show"
  get "posts/edit" => "posts#edit"
  post "posts/update" => "posts#update"
  
  root :to => "users#show"
end
