Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  resources :users, param: :id, path: '/', only: [:show] do
    resources :albums, param: :id, path: '/', only: [:show, :create, :destroy] do
      resources :posts, param: :id, path: '/'
    end
  end
  root "home#top",  as: "user_root"
end
