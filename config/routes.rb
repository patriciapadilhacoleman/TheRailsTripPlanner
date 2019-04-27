Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    get '/trips', to: 'trips#index'
    get '/trips/new', to: 'trips#new', as: 'new_trip'
    post '/trips', to: 'trips#create'
    get '/trips/:id', to: 'trips#show', as: 'trip'
    get '/trips/:id/edit', to: 'trips#edit', as: 'edit_trip'
    patch '/trips/:id', to: 'trips#update'
    delete '/trips/:id', to: 'trips#destroy'

    #root 'trips#index'
    get '/login' => 'sessions#new', as: 'login'
    post '/login' => 'sessions#create'
    post '/logout' => 'sessions#destroy'
    resources :users, only: [:new, :create]

   root 'welcome#home'

   get '/about', to: 'static#about'
   get '/contact', to: 'static#contact'

    resources :trips do
      resources  :users, only: [:index, :show]
      resources :tickets
      resources :days
    end

    resources :users, only: [:new, :create]

end
