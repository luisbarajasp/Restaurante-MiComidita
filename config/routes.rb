Rails.application.routes.draw do
  get 'dashboard', action: :dashboard, controller: 'pages'

  get '404', action: :not_found, controller: 'pages'

  resources :products
  resources :receipts
  resources :raw_inventories
  resources :raws
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#dashboard'
end
