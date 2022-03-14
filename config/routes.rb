Rails.application.routes.draw do 

  devise_for :users,
  controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
  }

  get 'home/index'
  get 'items/home_index', to: 'items#home_index'
  get 'items/related_items', to: 'items#related_items'
  post 'stars', to: 'item_stars#create'
  
  root to: 'users#index'

  resources :users do 
    resources :stores do
      resources :store_comments
      resources :store_analytics
      resources :item_analytics
      resources :store_stars
      resources :items do
        resources :item_variants
        resources :tags
        resources :item_comments
        resources :item_stars
        resources :orders do
          resources :order_variants
        end
      end
    end
  end

  resources :cities
  resources :categories do 
    resources :subcategories
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
