Rails.application.routes.draw do
  resources :comments
  devise_for :users
  get 'welcome/index'

  resources :users

  resources :rweets do
    resources :likes
    resources :comments
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'welcome#index'

  get 'logout' => 'sessions#destroy'
  get 'home' => 'rweets#index'
  get ':username' => 'users#show'
  delete 'post/:id' => 'rweets#destroy'
end
