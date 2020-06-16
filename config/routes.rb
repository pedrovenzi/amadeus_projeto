Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "application#homepage"
  resources :songs
  resources :albums

  scope 'users' do
    get 'novo_usuario', to: 'users#new', as: :new_user
    post 'novo_usuario', to: 'users#create'
  end
  
  scope 'auth' do
    get 'login', to: 'sessions#new', as: :login
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy', as: :logout
  end
end
