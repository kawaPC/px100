Rails.application.routes.draw do
  get "home", to: "home#index", as: "user_root"
  root "welcome#index"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  resources :users, only: [:show] do
    resources :albums, only: [:create, :destroy] do
      resources :posts
    end
  end
  
end
