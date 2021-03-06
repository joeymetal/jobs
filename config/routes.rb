Jobs::Application.routes.draw do 
  root 'home#index'
  get '/search' => 'jobs#search'
  match '/result' => 'jobs#result' , via: [:get, :post]
  get '/sobre_nos' => 'home#sobre_nos'
  get '/destaques' => 'jobs#featured'
  get '/servicos' => 'home#service'
  get '/contato' => 'contacts#new'
  get '/lista' => 'jobs#jobs_list'
  get '/perfil' => 'profiles#new'
  get '/phones' => 'phones#new'
  get '/endereco' => 'addresses#new'
  get '/informacao_pessoais' => 'applicants#new'
  get '/perfil_empresa' => 'customers#new'
  get 'termos_de_servico' => 'home#terms'

  resources :addresses
  resources :applicant_jobs
  resources :applicants
  resources :contacts
  resources :customers
  resources :jobs do 
    resources :applicant_jobs
  end
  resources :phones
  resources :profiles
 
  devise_for :users

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
