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
  post 'comments', to: 'item_comments#create'
  get 'comments', to: 'item_comments#item_detail_comments'
  get 'stores/home_index', to: 'stores#home_index'
  get 'stores/subcategory_stores', to: 'stores#subcategory_stores'
  get 'items/subcategory_items', to: 'items#subcategory_items'
  get 'store/:id', to: 'stores#show_store'
  get 'stores/my_store', to: 'stores#my_store'
  get 'items/my_items', to: 'items#my_items'
  get 'items/search', to: 'items#search'
  get 'stores/search', to: 'stores#search'
  post 'orders', to: 'orders#create'
  get 'orders/current_orders', to: 'orders#current_orders'
  post 'orders/set_ordered', to: 'orders#set_ordered'
  get 'orders/bought_orders', to: 'orders#bought_orders'
  delete 'orders', to: 'orders#destroy'
  get 'items/store_items', to: 'items#store_items'
  get 'orders/driver_orders', to: 'orders#driver_orders'
  get 'orders/all_orders', to: 'orders#all_orders'
  get 'orders/picked_up', to: 'orders#picked_up'
  get 'orders/delivered', to: 'orders#delivered'
  get 'item', to: 'items#show_item'
  post 'store_analytics/views', to: 'store_analytics#views'

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
