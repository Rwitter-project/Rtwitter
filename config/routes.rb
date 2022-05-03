Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'

  resources :users

  resources :rweets do
    resources :likes
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'welcome#index'

  get 'logout' => 'sessions#destroy'
  get 'posts' => 'rweets#index'
  get ':username' => 'users#show'
  delete 'post/:id' => 'rweets#destroy'
end
