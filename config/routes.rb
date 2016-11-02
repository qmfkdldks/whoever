Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'
  
  resources :resumes, only: [:index, :new, :create, :destroy]

  resources :products do 
     collection do
      post 'filter'
      post 'search'
    end
  end
  
  resources :comments, only: [:create, :update, :destroy]
  
  get 'profile/index'

  #devise_for :users
  devise_for :users, :controllers => { registrations: 'registrations' }
    
  constraints subdomain: 'blog' do
    root 'home#index'
    get 'home/index'
    
    resources :articles do
      #resources :comments # nested routing
      patch 'like', to: "articles#like", on: :member
    end    
  end 

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
