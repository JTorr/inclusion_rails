Rails.application.routes.draw do
  get 'home/index'

  resources :gem_fetchers, only: [:show, :new, :create]
  devise_for :users
  root to: "home#index"
end
