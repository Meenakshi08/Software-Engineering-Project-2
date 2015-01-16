Rails.application.routes.draw do

  get 'logins/new'

  get 'users/new'
 get 'show' => 'users#show', :as => 'show'
  get 'aboutus' => 'users#aboutus', :as => 'aboutus'
  get 'settings' => 'users#settings', :as => 'settings'
  get "log_in" => "logins#new", :as => "log_in"
  get "log_out" => "logins#destroy", :as => "log_out"

  get "sign_up" => "users#new", :as => "sign_up"
  
 #  get 'home/:id' => 'users#home', :as => 'home'
   
 #   get 'users/:id', to: 'users#home' 
	
	
  resources :users do
    member do
        get :cabadd
        get :cabdrop
        get :busadd
        get :busdrop
        get :trainadd
        get :traindrop
        get :flightadd
        get :flightdrop
        get :hoteladd
        get :hoteldrop
       
    end
end		
  resources :logins
	
  root 'logins#new'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
