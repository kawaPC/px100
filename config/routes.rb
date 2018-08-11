Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  
  resources :users, path: '/', only: [:show] do
    resources :albums, only: [:index,  :new, :create]
    resources :posts, only: [:show, :new, :create, :destroy]
  end
  resources :users, path: '/', only: [:show] do
    resources :albums, path: '/', only: [:show, :destroy]
  end
  
  root "home#top"
end