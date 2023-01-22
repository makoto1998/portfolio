Rails.application.routes.draw do

  mount ActionCable.server => '/cable'
  root to: 'events#index'
  get 'rooms/show'        => 'rooms#show'


  get 'goals/user'        => 'goals#user'
  get 'goals/new'         => 'goals#new'

  get 'statics/help'      => 'statics#help'
  get 'statics/policy'    => 'statics#policy'
  get 'statics/index'     => 'statics#index'

  get 'users/new'         => 'users#new'
  get 'users/:id/index'   => 'users#index'

  get 'posts/:id/destroy' => 'posts#destroy'

  get 'events/index'      => 'events/index'
  resources :events


  get 'groups/:id/destroy' => 'groups#destroy'
  resources :groups, only: [:index, :new, :create, :show, :edit, :update, :destroy]
  resources :groups do
    collection do
      get "search"
    end
  end



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

end
