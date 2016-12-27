Rails.application.routes.draw do
  resources :sales
  resources :categories
  resources :products
  resources :providers
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
