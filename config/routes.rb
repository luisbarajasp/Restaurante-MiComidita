Rails.application.routes.draw do
  resources :recipes
  get 'dashboard', action: :dashboard, controller: 'pages'

  get '404', action: :not_found, controller: 'pages'

  resources :products, except: [:edit, :update]
  resources :receipts
  resources :raws

  get 'raws/get_raw_inventories/:id' => 'raws#get_raw_inventories', as: :raw_inventories
  get 'recipes/get_recipe_materials/:id' => 'recipes#get_recipe_materials', as: :recipe_materials
  get 'products/get_recipe_materials/:id' => 'products#get_recipe_materials', as: :products_recipe_materials
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#dashboard'
end
