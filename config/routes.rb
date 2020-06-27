Rails.application.routes.draw do
  resources :articles do
    resources :votes, only: [:create, :destroy]
  end
  root to: "sessions#new"
  resources :users
  resources :categories
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
