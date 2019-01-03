Rails.application.routes.draw do
  
  #get 'demo/index'
  root "demo#index"
  match ':controller(/:action(/:id))', :via => [:get, :post]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
