Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index', as: :root

  # resources :merchants do
  #   resources :items, only: [:index]
  # end
  get '/merchants', to: 'merchants#index'
  get '/merchants/new', to: 'merchants#new'
  get '/merchants/:id', to: 'merchants#show', as: :merchant
  post '/merchants', to: 'merchants#create'
  get '/merchants/:id/edit', to: 'merchants#edit'
  patch '/merchants/:id', to: 'merchants#update'
  delete '/merchants/:id', to: 'merchants#destroy'

  get '/merchants/:merchant_id/items', to: 'items#index'
  ###

  # resources :items, only: [:index, :show] do
  #   resources :reviews, only: [:new, :create]
  # end
  get '/items', to: 'items#index', as: :items
  get '/items/:item_id/reviews/new', to: 'reviews#new', as: :new_item_review
  post '/items/:item_id/reviews', to: 'reviews#create', as: :item_reviews
  get '/items/:id', to: 'items#show', as: :item
  ###

  # resources :reviews, only: [:edit, :update, :destroy]
  get '/reviews/:id/edit', to: 'reviews#edit', as: :edit_review
  patch '/reviews/:id', to: 'reviews#update', as: :review
  delete '/reviews/:id', to: 'reviews#destroy'
  ###

  get '/cart', to: 'cart#show'
  post '/cart/:item_id', to: 'cart#add_item'
  delete '/cart', to: 'cart#empty'
  patch '/cart/:change/:item_id', to: 'cart#update_quantity'
  delete '/cart/:item_id', to: 'cart#remove_item'

  
  get '/registration', to: 'users#new', as: :registration
  resources :users, only: [:create, :update]
  patch '/user/:id', to: 'users#update'
  get '/profile', to: 'users#show'
  get '/profile/edit', to: 'users#edit'
  get '/profile/edit_password', to: 'users#edit_password'

  post '/orders', to: 'user/orders#create'
  get '/profile/orders', to: 'user/orders#index'
  get '/profile/orders/:id', to: 'user/orders#show'
  delete '/profile/orders/:id', to: 'user/orders#cancel'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#login'
  get '/logout', to: 'sessions#logout'


  get '/discounts', to: 'discounts#index'

  namespace :merchant do
    get '/', to: 'dashboard#index', as: :dashboard

    # get '/discounts', to: 'discounts#index', as: :discounts
    # get '/discounts/new', to: 'discounts#new'
    # post '/discounts', to: 'discounts#create'
    # get '/discounts/:id', to: 'discounts#show'
    # get '/discounts/:id/edit', to: 'discounts#edit'
    # patch '/discounts/:id', to: 'discounts#update'
    # delete '/discounts/:id', to: 'discounts#destroy'
    resources :discounts
    ###

    # resources :orders, only: :show
    get '/orders/:id', to: 'orders#show'
    ###


    # resources :items, only: [:index, :new, :create, :edit, :update, :destroy]
    get '/items', to: 'items#index'
    get '/items/new', to: 'items#new'
    post '/items', to: 'items#create'
    get '/items/:id/edit', to: 'items#edit'
    patch '/items/:id', to: 'items#update'
    put '/items/:id', to: 'items#update'
    delete '/items/:id', to: 'items#destroy'
    ###

    put '/items/:id/change_status', to: 'items#change_status'
    get '/orders/:id/fulfill/:order_item_id', to: 'orders#fulfill'
  end

  namespace :admin do
    get '/', to: 'dashboard#index', as: :dashboard
    # resources :merchants, only: [:show, :update]
    get '/merchants/:id', to: 'merchants#show', as: :admin_merchant
    patch '/merchants/:id', to: 'merchants#update'
    put '/merchants/:id', to: 'merchants#update'
    ###

    # resources :users, only: [:index, :show]
    get '/users', to: 'users#index', as: :admin_users
    get '/users/:id', to: 'users#show', as: :admin_user
    ###

    patch '/orders/:id/ship', to: 'orders#ship'
  end
end
