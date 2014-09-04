Rails.application.routes.draw do
  resources :gem_fetchers, only: [:index, :new, :create, :show]
  resources :favorites, only: [:index]
  devise_for :users
  root to: "home#index"

  #   resources :jobs do
  #   resource :favorites, only: [:create, :destroy]
  # end
end
