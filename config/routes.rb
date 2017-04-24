Rails.application.routes.draw do

  resources :posts
  #definimos el root_path
  root :to => 'auth#index'

  # User´s authentication
  get '/login' => 'auth#new'
  post '/login' => 'auth#create'
  get '/logout' => 'auth#destroy'

  #routes de la ordera
  resources :orders
  get '/orders/receivable/:id', to: 'orders#receivable'
  get '/orders/sendKitchen/:id', to: 'orders#sendKitchen'
  get '/orders_history', to: 'orders#history'

  resources :plates
  resources :tables, except: :show
  resources :categories,except: :show
  resources :users
  resources :profiles,except: :show


  #Routes agregar platos a la orders_path
  get '/orders/:id/plates', to: 'orders_plates#index'
  post '/addPlateOrder', to: 'orders_plates#addPlateOrder'
  delete '/removePlateOrder', to: 'orders_plates#removePlateOrder'

  #Route para marcar plato como preparado
  post '/preparedDish', to: 'orders#preparedDish'
end
