Skare::Application.routes.draw do
  post "users/create" => "users#create"
  resources :sessions, only: [:new, :create, :destroy]
  get "welcome" => "welcome#index"
  get "sessions/destroy" => "sessions#destroy"
  get "user" => "users#show"
  get "user/destroy" => "users#destroy"
  root :to => "users#show"
end
