HonestLawyers::Application.routes.draw do
    # authenticated :user do # authenticated only works with devise
    #   root :to => "users#show"
    # end

    root :to => "welcome#index"
    get '/matters/search', to: 'matters#search', as: 'search_matter'


    match '/signup',  to: 'users#new',            via: 'get'
    match '/signin',  to: 'sessions#new',         via: 'get'
    match '/signout', to: 'sessions#destroy',     via: 'delete'

    resources :sessions, only: [:new, :create, :destroy]

    resources :users

    resources :users do
      resources :matters, only: [:new, :create]
    end

    resources :matters do
      resources :tasks, only: [:create, :index]
    end

    resources :tasks, only: [:show, :stop, :edit, :update]

    get '/matters/:id/close', to: 'matters#close', as: 'close_matter'

    post '/tasks/:id/update_current', to: 'tasks#update_current', as: 'update_current_task'
    post '/tasks/:id/stop', to: 'tasks#stop', as: 'stop_task'

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
