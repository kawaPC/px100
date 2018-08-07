Rails.application.routes.draw do
  get "home", to: "home#index", as: "user_root"
  root "welcome#index"
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  
  resources :users, param: :name, path: '/', only: [:show] do
    resources :albums, param: :name, path: '/', only: [:create, :destroy] do
      resources :posts, param: :id, path: '/'
    end
  end
  
end
