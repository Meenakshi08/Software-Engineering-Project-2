Rails.application.routes.draw do

  resources :bookings do
  	resources :last_cab_bookings 
  end
  
  match '/cab_bookings/create' => 'bookings#create', :via => :post, :as => :create
  
  match '/users/:id/customers/:id/cab_bookings/:id' => 'bookings#show', :via => :get, :as => :show
  
  match 'cab_bookings/update' => 'bookings#update', :via => :post, :as => :update
  
  match '/users/:id/customers/:id/cab_bookings/:id/last_cab_bookings/:id' => 'bookings#show', :via => :get, :as => :last
  
  match '/users/:id/customers/:id/cab_bookings/:id/next_cab_bookings/:id' => 'bookings#show', :via => :get, :as => :next

  match '/adduser_cab' => 'registerusers#addcab', :via => :post, :as => :addcab
  
  match '/dropuser_cab' => 'registerusers#dropcab', :via => :post, :as => :dropcab
  
  match '/queryuser_cab' => 'registerusers#querycab', :via => :post, :as => :querycab

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
