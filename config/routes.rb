Rails.application.routes.draw do
  root to: 'homepage#index', via: :get
  resource :dashboard, only: [:show]
  resource :archive, only: [:show]
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :links, only: [:create, :show, :destroy] do
    member do
      put 'archive'
      put 'restore'
    end
  end
end
