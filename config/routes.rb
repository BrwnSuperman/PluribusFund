PluribusFund::Application.routes.draw do
  get "log_ins/create"
  get "static_pages/home"
  get "static_pages/help"
  get "/about" => 'static_pages#about', as: 'about'

  resources :projects

  resources :users

  resources :subscriptions
  root :to => 'static_pages#home'

  post '/about', to: 'static_pages#about'

  get '/sign_up' => 'users#new', as: 'sign_up'
  post '/sign_up' => 'users#create'

  get '/log_in'  => 'log_ins#new', as: 'log_in'
  post '/log_in'  => 'log_ins#create'
  post '/log_out' => 'log_ins#destroy', as: 'log_out'

  get '/forgot_password' => 'password_resets#new', as: 'forgot_password'
  post '/forgot_password' => 'password_resets#create'

  get '/reset_password/:id/:token;' => 'password_resets#edit', as: 'reset_password'
  post '/reset_password/:id/:token;' => 'password_resets#update'

  post '/raise', to: 'static_pages#raisefunds'
  post '/tou',  to: 'static_pages#tou'
  post '/privacy',  to: 'static_pages#privacy'
  post '/campaigntest', to: 'static_pages#campaigntest'
  post '/contact_email', :to => 'static_pages#sendmail'
  post '/contact', :to => 'static_pages#contact'
  post '/dashboard', :to => 'static_pages#dashboard'
end

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