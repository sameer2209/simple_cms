Rails.application.routes.draw do
  
  #get 'demo/index'
  root "demo#index"
  
  # match ':controller(/:action(/:id))', :via => [:get, :post]
  #get '/users/:id/' =>'users#show', :as => :user
  resources :subjects
  resources :pages	
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
