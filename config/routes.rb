Facebook::Application.routes.draw do
  
  #root :to => 'users#new', :as => 'sign_up'

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  post "users/:id(.:format)" => "users#show", :as => "user"
  get "users/:id/profile(.:format)" => "users#profile", :as => "user_profile"
  post "users/:id/profile(.:format)" => "users#profile", :as => "user_profile"
  get "users/:id/newsfeed(.:format)" => "users#newsfeed", :as => "user_newsfeed"
  #get "users/:id/search(.:format)" => "users#search", :as => "user_search"
  resources :users, only: [:search] do 
	get 'search(.:format)', :controller => "users", :action => "search", :as => :search
	post 'search(.:format)', :controller => "users", :action => "search", :as => :search
  end
  #root :to => "users#new"
  resources :users do
	#post '', :controller => "users", :action => "show"
	resources :friends
	resources :posts
	resources :friendrequests
	  #post 'new(.:format)', :controller => "friends", :action => "new", :as => :new
  end
  resources :sessions
  
  
  #match "users/login(.:format)", :controller => "users", :action => "login", :via => [:get], :as => :login
  
  #resources :users
  
  #resource :user do
  #  get '(.:format)' => 'users#index'
  #	post '/login(.:format)' => 'users#login', :as => :login
  #	get '/:id/edit(.:format)' => 'users#edit', :as => :edit
  #	get '/:id(.:format)' => 'users#show', :as => :show
  #	put '/:id(.:format)' => 'users#update', :as => :update
  #	delete '/:id(.:format)' => 'users#destroy', :as => :destroy
  #end

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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
