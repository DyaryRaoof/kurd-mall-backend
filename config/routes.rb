Rails.application.routes.draw do
  resources :cities
 

  devise_for :users
  get 'home/index'
  root to: 'users#index'

  resources :users do 
    resources :stores do
      resources :store_comments
      resources :items do
        resources :item_variants
        resources :tags
        resources :item_comments
        resources :orders do
          resources :order_variants
        end
      end
    end
  end

  resources :categories do 
    resources :subcategories
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
