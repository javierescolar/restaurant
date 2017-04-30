Rails.application.routes.draw do


  #definimos el root_path
  root :to => 'auth#index'

  # User´s authentication
  get '/login' => 'auth#new'
  post '/login' => 'auth#create'
  get '/logout' => 'auth#destroy'

  #routes de la order
  resources :orders
  get '/orders/receivable/:id', to: 'orders#receivable'
  get '/orders/sendKitchen/:id', to: 'orders#sendKitchen'
  get '/orders_history', to: 'orders#history'

  resources :plates
  get '/platesFilterCategory', to: 'plates#filterDishes'

  resources :tables, except: :show
  resources :categories,except: :show
  resources :users
  resources :profiles,except: :show


  #Routes agregar platos a la orders_path
  get '/orders/:id/plates', to: 'charges#index'
  #ruta parra filtrar platos al añadir plato
  get '/orders/:id/plates', to: 'charges#filterDishes'
  #borra y anadir platos a la comanda
  post '/questionnaireAddCharge' => 'charges#questionnaire'
  post '/addCharge', to: 'charges#addCharge'
  delete '/removeCharge', to: 'charges#removeCharge'


  #Route para marcar plato como preparado
  post '/preparedDish', to: 'charges#preparedDish'

#rutas de la version 2
  resources :answers, except: :show
  resources :questions, except: :show
  resources :dishes_products
  resources :products, except: :show
  resources :posts


end
