Rails.application.routes.draw do
  resources :profiles
  resource :users
  put "/users/:id", to: "users#update"
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
end
