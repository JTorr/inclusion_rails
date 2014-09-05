Rails.application.routes.draw do
  get 'projects/index'
<<<<<<< HEAD

  get 'projects/show'

  get 'projects/create'

  get 'projects/new'

  get 'projects/edit'

  get 'projects/update'

  get 'projects/destroy'

  resources :gem_fetchers, only: [:index, :new, :create, :show]
  resources :favorites, only: [:index, :create, :destroy]
=======

  get 'projects/show'

  get 'projects/create'

  get 'projects/new'

  get 'projects/edit'

  get 'projects/update'

  get 'projects/destroy'

  resources :favorites, only: [:index, :create, :destroy]
  get 'home/index'

  resources :gem_apis, only: [:show, :new, :create]
>>>>>>> 09acbcbee4b7e2491abb1851bcd5fd2cb7614559
  devise_for :users
  root to: "home#index"
end
