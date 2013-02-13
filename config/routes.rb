Skare::Application.routes.draw do
  post "user/auth" => "users#authenticate"
  post "user/create" => "users#create"
  get "user/show" => "users#show"
  root :to => "welcome#index"
end
