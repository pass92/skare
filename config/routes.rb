Skare::Application.routes.draw do
  post "user/auth" => "users#authenticate"
  get "user/show" => "users#show"
  root :to => "welcome#index"
end
