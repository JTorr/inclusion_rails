Rails.application.routes.draw do
  get 'projects/index'

  get 'projects/show'

  get 'projects/create'

  get 'projects/new'

  get 'projects/edit'

  get 'projects/update'

  get 'projects/destroy'

  resources :gem_fetchers, only: [:index, :new, :create, :show]
  resources :favorites, only: [:index, :create, :destroy]
  devise_for :users
  root to: "home#index"
end
