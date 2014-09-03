Rails.application.routes.draw do
  get 'home/index'

  resources :gem_fetchers, only: [:index, :new, :create, :show]
  devise_for :users
  root to: "home#index"
end
