Rails.application.routes.draw do
  get '', to: 'home#index'

  resource  :contacts, only: [:new, :create], path_names: {:new => ''}
  
  #get '/terms', to: :show, controller: 'terms'
  # get 'terms', to: 'terms#show'
  # get 'about', to: 'about#show'

  get 'terms' => 'pages#terms'
  get 'about' => 'pages#about'

  #get 'about', to: 'show', controller: 'about'
 
  resources :articles, path_names: {:create => 'home/index', :update => 'home#index'} do
    resources :comments, only: [:create]
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
