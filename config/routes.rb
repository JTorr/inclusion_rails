Rails.application.routes.draw do
  get 'home/index'

<<<<<<< HEAD
  resources :gem_fetchers, only: [:index, :new, :create, :show]
=======
  resources :gem_fetchers, only: [:show, :new, :create]
>>>>>>> b0e624d4c792f29a3431f0494d7b0a4a15b93941
  devise_for :users
  root to: "home#index"
end
