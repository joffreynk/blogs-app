Rails.application.routes.draw do

  root to: 'users#index'
  devise_for :users
  resources :users, only: %i[index, show] do
    resources :posts, only: %i[index, show]
  end

  get "/", to: "users#index"
  get "/users", to: "users#index"
  get "/users/:id/posts", to: "posts#index"
  get "/createpost", to: "posts#loadpost"
  post "/new", to: "posts#new"
  get "/loadcomment/:id" , to: "comments#index"
  post "/comment", to: "comments#comment"
  post "/like", to: "likes#index"

end
