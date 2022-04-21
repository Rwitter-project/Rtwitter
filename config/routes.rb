Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'welcome#index'

  get 'logout' => 'sessions#destroy'
  get 'profil' => 'welcome#profil'
  get 'posts' => 'rweets#index'
end
