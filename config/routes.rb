Skare::Application.routes.draw do
  post "user/auth" => "users#authenticate"
  post "user/create" => "users#create"
  get "user/show" => "users#show"
  get "welcome" => "welcome#index"
  get "welcome" => "users#logout"
  root :to => "users#show"
end
