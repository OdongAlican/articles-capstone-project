Rails.application.routes.draw do
  resources :articles do
    resources :votes, only: [:create, :destroy]
  end
  root to: "sessions#new"
  resources :users, only: [:create, :new, :show]
  resources :categories
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
