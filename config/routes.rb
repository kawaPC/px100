Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  
  resources :users, path: '/', only: [:show] do
    resources :albums, only: [:index,  :edit, :new, :create]
    resources :posts, only: [:show, :new, :create, :destroy]
  end
  resources :users, path: '/', only: [:show] do
    resources :albums, path: '/', only: [:show, :destroy, :update] do
      member do
        get :horizontal
        get :vartical
        get :chess
      end
    end
  end
  
  root "home#top"
end