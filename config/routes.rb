Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  
  # resources :users, param: :name, expect: [:show, :destroy] do
  #   resources :albums, param: :name, path: '/', only: [:show, :new, :create, :destroy]
  # end
  
  # resources :users, path: '/', only: [:show] do
  #   resources :albums, only: [:index, :show, :new, :create, :destroy] do
  #     resources :posts, path: '/', only: [:show, :new, :create, :destroy]
  #   end
  # end
  
  resources :users, path: '/', only: [:show] do
    resources :albums, only: [:index, :show, :new, :create, :destroy]
    resources :posts, only: [:show, :new, :create, :destroy]
  end
  # root "home#top",  as: "user_root"
end
