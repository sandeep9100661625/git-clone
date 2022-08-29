Rails.application.routes.draw do
  root "pages#home"
  get 'signin', to: "users#new"
  resources :users
  resources :posts
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
