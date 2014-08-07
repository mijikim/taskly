Rails.application.routes.draw do
  root "task_lists#index"
  get "signin" => "sessions#new", as: :signin
  post "signin" => "sessions#create"
  get "signout" => "sessions#destroy", as: :signout
  get "about" => "about#about"

  get "/task_lists/:id/completed" => "task_lists#show"
  resources :task_lists do
    resources :tasks
  end

end
