Rails.application.routes.draw do
  
  resources :hotels do 
    member do
      get :access
    end
  end
  resources :items do
    collection do 
      get :histories
    end
  end
  resources :expenses
  resources :orders do
  	collection do
  		get :status
      get :ice
      get :menu_sorting
      post :update_menu
      get :role
      get :edited_orders
  		get :inbox
      get :decision
      get :blocked_notification
      get :my_hotel
      get :apply
      get :approve
      get :reject
      get :make_admin
      get :hotel_request
      get :all_users
      get :small
      get :sold_products
  	end
  end
  resources :one_menus
  resources :products
  devise_for :users, controllers: {
    sessions: 'sessions',
    registrations: 'registrations'
  }
  root 'orders#new'  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
