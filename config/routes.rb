Rails.application.routes.draw do

  get 'all_users' => 'users#view_all_users'
  post 'add_user_to_admin' => 'users#add_user_to_admin'

  post 'add_to_cart' => 'cart#add_to_cart'
  post 'edit_cart_quantity' => 'cart#edit_cart_quantity'
  post 'remove_from_cart' => 'cart#remove_from_cart'
  get 'view_order' => 'cart#view_order'
  get 'checkout' => 'cart#checkout'
  post 'order_complete' => 'cart#order_complete'

  devise_for :users

  get 'categorical' => 'storefront#items_by_category'
  get 'branding' => 'storefront#items_by_brand'
  resources :products

  root 'storefront#all_items'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
