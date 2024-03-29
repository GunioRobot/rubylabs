Rubylabs::Application.routes.draw do
 
  # get "wolfram_alpha/show"

  # resources :users do
  #   member do
  #     get :posts, :categories
  #   end
  # end
  
        
  resources :posts
  resources :users
  resources :categories
  resources :sessions

  
  match '/wolfram_alpha', :to => 'wolfram_alpha#show'
  match '/contact', :to => 'pages#contact'
  match '/about'  , :to => 'pages#about'
  match '/home'   , :to => 'pages#home'
  match '/flickr' , :to => 'flickr#index'


  get "posts/create"
  get "posts/destroy"
  
  get "categories/create"
  get "categories/destroy"
  
  get "users/create"
  get "users/destroy"
  get "users/new"
  get "users/edit"

  get "signup" => "users#new", :as => "sign_up"
  get "login" => "sessions#new", :as => "log_in"
  get "logout" => "sessions#destroy", :as => "log_out"
  
  # root :to => "pages#home"

  root :to => "pages#home"
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
