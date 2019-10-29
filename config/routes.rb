Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/songs', to: 'songs#index'
  get '/songs/:id', to: 'songs#show'

  get '/artists', to: 'artists#index'
  get '/artists/new', to: 'artists#new'
  get '/artists/:id', to: 'artists#show'
  get '/artists/:id/edit', to: 'artists#edit'
  get "/artists/:artist_id/songs/new", to: 'songs#new'

  get '/playlists', to: 'playlists#index'

  post "/artists/:artist_id/songs", to: 'songs#create'
  post '/artists', to: 'artists#create'
  delete '/artists/:id', to: 'artists#destroy'
  put '/artists/:id', to: 'artists#update'

  patch '/cart/:song_id', to: 'cart#update'

  namespace :admin do
    get '/dashboard', to: 'dashboard#index'
  end
end
