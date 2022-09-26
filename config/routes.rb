Rails.application.routes.draw do
  resources :users, only: %i[show] do
    resources :posts, only: %i[index, show]
  end

  get "/", to: "users#index"
  # get "/users/:id", to: "users#show"

  # get "/users/:id/posts", to: "posts#index"
  # get "/users/:id/posts/:id", to: "posts#show"


  # get "/users/:id", to: "/users#show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
