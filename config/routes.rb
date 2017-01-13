Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth',controllers: {
      sessions: 'users/sessions'
    }
  resources :inventories
  resources :sales
  resources :categories
  resources :products
  resources :providers
end
