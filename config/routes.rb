Rails.application.routes.draw do
  resources :users, only: %i[index, show] do
    resources :posts, only: %i[index, show]
  end

  get "/", to: "users#index"
  get "/users", to: "users#index"
  get "/users/:id/posts", to: "posts#index"

end
