Rails.application.routes.draw do
  get 'projects/index'

  get 'projects/show'

  get 'projects/create'

  get 'projects/new'

  get 'projects/edit'

  get 'projects/update'

  get 'projects/destroy'

  resources :favorites, only: [:index, :create, :destroy]
  get 'home/index'

  resources :gem_apis, only: [:show, :new, :create]
  devise_for :users
  root to: "home#index"
end
