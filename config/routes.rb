Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  resources :rweets do
    resources :likes
  end

  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'welcome#index'

  get 'posts' => 'rweets#index'
  delete 'post/:id' => 'rweets#destroy'

end
