Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  root to: 'users#index'

  resources :users , only: [:index] do 
    resources :stores do
      resources :items do
        resources :item_variants
        resources :tags
      end
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
