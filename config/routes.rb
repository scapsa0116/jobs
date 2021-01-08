Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "sessions#home"
  get '/signup' => 'users#new'
  
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  resources :users, only: [:new, :create]
  resources :jobs, only: [:edit, :index, :new, :show]

  resources :jobs do
    resources :reviews
  end

  resources :users do 
    resources :jobs, shallow: true
  end
  resources :categories, only: [:index, :new, :show]

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