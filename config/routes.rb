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
    collection do
    get 'confirm'
    end
    # resources :images, only: [ :new, :create] 
  end

  # 画像投稿検証のための記述。
  # 検証後は11行目の記述をコメントアウトし、16行目を削除する。
  resources :images, only: [:new, :create] 

  resources :users, only: [:new, :show, :destroy] do
    resources :cards, only: [:new]
    collection do
      get "user_logout"
    end
  end
end
