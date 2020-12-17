Rails.application.routes.draw do
  
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
      get :edited_orders
  		get :inbox
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
