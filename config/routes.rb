Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  
  resources :users, path: '/', only: [:show] do
    resources :posts, except: [:index, :edit]
    resources :albums, except: [:edit]
  end
  get '/posts/edit', to: 'posts#edit'
  get '/albums/edit', to: 'albums#edit'
  get '/:user_id/:album_id/posts', to: 'posts#index' 
  get '/:user_id/:album_id/posts/horizontal', to: 'posts#horizontal'
  get '/:user_id/:album_id/posts/vartical', to: 'posts#vartical'
  get '/:user_id/:album_id/posts/chess', to: 'posts#chess'
  
  root "home#top"
end