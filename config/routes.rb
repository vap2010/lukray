Rails.application.routes.draw do


  namespace :admin do
    resources :photos
  end

  namespace :admin do
    resources :banners
  end

  namespace :admin do
    resources :big_images
  end

  namespace :admin do
    resources :categories
  end

  namespace :admin do
    resources :users
  end

  root 'main#home'
  
  # get 'main/home'
  
  get 'main/page/:id'  => 'main#page'
  get 'main/modal/:id' => 'main#modal'
   
  get 'main/township'
  get 'main/plan'
  get 'main/location'
  get 'main/infrastructure'
  get 'main/nature'
  get 'main/gallery'
  get 'main/environs'
  get 'main/customers'
  get 'main/contacts'

  get 'main/main'
  get 'main/about'
  get 'main/place'
  get 'main/infro'
  get 'main/around'
  get 'main/price'
  get 'main/contact'
  get 'main/photo'
  get 'main/sale'
  get 'main/services'


  get 'post/viewing_areas'
  get 'post/consultation'
  get 'post/back_call'
  get 'post/booking_area'
  get 'post/question_from_site'
  get 'post/recommendation'
  get 'post/fsm_status'
  get 'post/business'
  get 'post/other'

  post 'post/in_viewing_areas'
  post 'post/in_consultation'
  post 'post/in_back_call'
  post 'post/in_booking_area'
  post 'post/in_question_from_site'
  post 'post/in_recommendation'
  post 'post/in_fsm_status'
  post 'post/in_business'
  post 'post/in_other'


  get 'lk/home'       #, as: 'user_root'
  get 'lk/profile'
  get 'lk/order'
  get 'lk/consultation'


  devise_for :users

  
  namespace :admin do
    get 'home/index'
    get 'home/stats'
    get 'home/adm'
    resources :pages
    resources :meta_tags
    resources :messages
    resources :homesteads do
      collection do
        get 'mkr1'
        get 'mkr2'
        get 'mkr3'
        get 'stats'
      end
    end
  end
  
  
  mount Ckeditor::Engine => '/ckeditor'

  
  #-----------------------------------------------------------------
  

  # You can have the root of your site routed with "root"
  # root 'main#index'
  
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
