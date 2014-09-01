Judohp::Application.routes.draw do

  match '/home',  to: 'static_pages#home', via: :get

  scope(:path_names => { :new => I18n.t('views.new').downcase, :edit => I18n.t('views.edit').downcase }) do
    resources :age_classes, :path => I18n.t('age_classes.short') do
      get "delete"
    end
  end

  scope(:path_names => { :new => I18n.t('views.new').downcase, :edit => I18n.t('views.edit').downcase }) do
    resources :competitions, :path => I18n.t('competitions.short') do
      get "delete"
    end
  end

  scope(:path_names => { :new => I18n.t('views.new').downcase, :edit => I18n.t('views.edit').downcase }) do
    resources :competition_templates, :path => I18n.t('competition_templates.short') do
      get "delete"
    end
  end

  scope(:path_names => { :new => I18n.t('views.new').downcase, :edit => I18n.t('views.edit').downcase }) do
    resources :members, :path => I18n.t('members.short') do
      get "delete"
    end
  end

  scope(:path_names => { :new => I18n.t('views.new').downcase, :edit => I18n.t('views.edit').downcase }) do
    resources :people, :path => I18n.t('people.short') do
      get "delete"
    end
  end
  scope(:path_names => { :new => I18n.t('views.new').downcase, :edit => I18n.t('views.edit').downcase }) do
    resources :roles, :path => I18n.t('roles.short') do
      get "delete"
    end
  end
  scope(:path_names => { :new => I18n.t('views.new').downcase, :edit => I18n.t('views.edit').downcase, :delete => I18n.t('views.delete').downcase  }) do
    resources :users, :path => I18n.t('users.short') do
      get "delete"
    end
  end
  scope(:path_names => { :new => I18n.t('views.new').downcase, :edit => I18n.t('views.edit').downcase, :delete => I18n.t('views.delete').downcase  }) do
    resources :venues, :path => I18n.t('venues.short') do
      get "delete"
    end
  end
  resources :sessions, only: [:new, :create, :destroy]

  match I18n.t('sessions.new.action').downcase, to: 'sessions#new', via: :get, as: 'signin'
  match I18n.t('sessions.destroy.action').downcase, to: 'sessions#destroy', via: :delete, as: 'signout'

  match "/#{I18n.t('activerecord.models.user').downcase}/#{I18n.t('users.activate.title').downcase}/:activation_token", to: 'users#activate', via: :get, as: 'activate'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static_pages#home'

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
