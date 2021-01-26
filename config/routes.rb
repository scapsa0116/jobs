Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/auth/google_oauth2' => 'sessions#omniauth'
  get '/auth/:provider/callback' => 'sessions#omniauth', as: 'google_callback'
  root to: "sessions#home"
  get '/signup' => 'users#new'
  # post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :jobs, only: [:edit, :index, :new, :show]
  resources :categories, only: [:index, :new, :show]
  resource :session, only: [:create]

  resources :jobs do
    collection do
      get 'search'
    end
    resources :reviews, except: [:index]
  end

  resources :users

  # resources :reviews, only: [:edit, :index, :new, :show]
  
  resources :users do 
    resources :jobs, shallow: true
  end

  resources :categories do
    resources :jobs
  end

end


# get '/users/most-active' => 'users#most_active'


#   get '/signup' => 'users#new'
#   post '/signup' => 'users#create'

#   get '/signin' => 'sessions#new'
#   post '/signin' => 'sessions#create'
      
#   get '/logout' => 'sessions#destroy', via: [:get, :post]
  
  
#   get "/auth/google_oauth2/callback" => 'sessions#google'
 
  
  
#   resources :jobs do
#     resources :reviews
#   end

#   resources :reviews


  
#   resources :users do 
#     resources :jobs, shallow: true
#   end
  
#   resources :categories, only: [:index, :show]