Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'

  resources :items do
    member do
      get 'confirm'
    end
    collection do
      get 'set_parents'
      get 'set_children'
      get 'set_grandchildren'
    end
    resources :images, only: [:new, :create]
  end

  get 'users', to: 'users#index'

  resources :users, only: [:new, :show] do
    resources :cards, only: [:new]
    collection do
      get 'user_logout'
    end
  end
end
