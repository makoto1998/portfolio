Rails.application.routes.draw do
  get 'rooms/show'        => 'rooms#show'

  get 'goals/user'        => 'goals#user'
  get 'goals/new'         => 'goals#new'

  # get 'statics/how'       => 'statics#how' 使わない削除予定
  get 'statics/help'      => 'statics#help'
  get 'statics/policy'    => 'statics#policy'
  get 'statics/index'     => 'statics#index'
  get 'statics/show'      => 'statics#show'

  get 'users/new'         => 'users#new'
  get 'users/index'       => 'users#index'

  get 'posts/:id/destroy' => 'posts#destroy'

  root to: 'events#index'
  resources :events


  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # controllers: { registrations: 'users/registrations' }
  resources :users, only: [:show]

  resources :posts

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "sessions#new"

  mount ActionCable.server => '/cable' #バックエンドとフロントエンドをつなぐ
end
