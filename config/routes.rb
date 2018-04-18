Rails.application.routes.draw do
  resources :products
  resources :receipts
  resources :raw_inventories
  resources :raws
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'raws#index'
end
