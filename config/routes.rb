Rails.application.routes.draw do
  resources :gem_fetchers, only: [:index, :new, :create, :show]
  resources :favorites, only: [:index, :create, :destroy]
  devise_for :users
  root to: "home#index"
end
