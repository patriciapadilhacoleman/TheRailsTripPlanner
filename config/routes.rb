Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    get '/trips', to: 'trips#index'
    get '/trips/new', to: 'trips#new', as: 'new_trip'
    post '/trips', to: 'trips#create'
    get '/trips/:id', to: 'trips#show', as: 'trip'
    get '/trips/:id/edit', to: 'trips#edit', as: 'edit_trip'
    patch '/trips/:id', to: 'trips#update'
    delete '/trips/:id', to: 'trips#destroy'
    # delete '/people/:id', to: 'people#destroy', as:'person'

    #root 'trips#index'
    get '/login' => 'sessions#new', as: 'login'
    post '/login' => 'sessions#create'
    post '/logout' => 'sessions#destroy'
    get '/logout' => 'sessions#destroy'

   resources :tickets
   root 'welcome#home'

   get '/about', to: 'static#about'
   get '/contact', to: 'static#contact'

    resources :trips do
      resources  :users, only: [:index, :show]
      resources :tickets
      resources :days
    end


    get '/users', to: 'users#index'
    get '/users/new', to: 'users#new', as: 'new_user'
    post '/users', to: 'users#create'
    get '/users/:id', to: 'users#show', as: 'user'
    get '/users/:id/edit', to: 'users#edit', as: 'edit_user'
    patch '/users/:id', to: 'users#update'
    delete '/users/:id', to: 'users#destroy'

    match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
    match 'auth/failure', to: redirect('/'), via: [:get, :post]
    match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]

end
