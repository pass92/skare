Skare::Application.routes.draw do
  get "welcome/index"
  get "user/auth" => "users#authenticate"
  get "user/show" => "users#show"
  root :to => "welcome#index"
end
