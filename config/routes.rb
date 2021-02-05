Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "application#homepage"

  # resources :songs
  scope 'songs' do
    get '/new', to: 'songs#new', as: :new_song
    post '/new', to: 'songs#create'
    get '/show/:id', to: 'songs#show', as: :song
    get '/', to: 'songs#index', as: :songs
    get '/edit/:id', to: 'songs#edit', as: :edit_song
    patch '/edit/:id', to: 'songs#update'
    delete '/delete/:id', to: 'songs#destroy', as: :delete_song
  end

  # resources :albums
  scope 'albums' do
    get '/new', to: 'albums#new', as: :new_album
    post '/new', to: 'albums#create'
    get '/show/:id', to: 'albums#show', as: :album
    get '/', to: 'albums#index', as: :albums
    get '/edit/:id', to: 'albums#edit', as: :edit_album
    patch '/edit/:id', to: 'albums#update'
    delete '/delete/:id', to: 'albums#destroy', as: :delete_album
  end

  # resources :favoritesongs
  scope 'favoritesongs' do
    get '/new', to: 'favoritesongs#new', as: :new_favoritesong
    post '/new', to: 'favoritesongs#create'
    get '/show/:id', to: 'favoritesongs#show', as: :favoritesong
    get '/', to: 'favoritesongs#index', as: :favoritesongs
    get '/edit/:id', to: 'favoritesongs#edit', as: :edit_favoritesong
    patch '/edit/:id', to: 'favoritesongs#update'
    delete '/delete/:id', to: 'favoritesongs#destroy', as: :delete_favoritesong
  end

  resources :songplaylists, only: [:new, :create, :destroy]
  # scope 'songplaylists' do
  #   get '/new', to: 'favoritesongs#new', as: :new_songplaylist
  #   post '/new', to: 'favoritesongs#create', as: :songplaylists
  #   delete '/delete/:id', to: 'favoritesongs#destroy', as: :delete_songplaylist
  # end

  # resources :playlists
  scope 'playlists' do
    get '/new', to: 'playlists#new', as: :new_playlist
    post '/new', to: 'playlists#create'
    get '/show/:id', to: 'playlists#show', as: :playlist
    get '/', to: 'playlists#index', as: :playlists
    get '/edit/:id', to: 'playlists#edit', as: :edit_playlist
    patch '/edit/:id', to: 'playlists#update'
    delete '/delete/:id', to: 'playlists#destroy', as: :delete_playlist
  end

  # Login
  scope 'users' do
    get 'novo_usuario', to: 'users#new', as: :new_user
    post 'novo_usuario', to: 'users#create'
  end
  
  # Register
  scope 'auth' do
    get 'login', to: 'sessions#new', as: :login
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy', as: :logout
  end
end

# Mensagem para erros '-'

# match '/401', to: 'errors#unauthorized', via: :all, as: :error_401
# match '/404', to: 'errors#not_found', via: :all, as: :error_404
# match '/422', to: 'errors#unprocessable_entity', via: :all, as: :error_422
# match '/500', to: 'errors#internal_server_error', via: :all, as: :error_500