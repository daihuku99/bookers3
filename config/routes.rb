Rails.application.routes.draw do
  root to: 'homes#top'

  get 'home/about' => 'homes#about',as: :about

  devise_for :users, controllers: {
  	sessions: 'users/sessions',
  	registrations: 'users/registrations'
  	}

  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]

  resources :users, only: [:show, :edit, :update, :index]

  get "search" => "users#search"

  post 'follow/:id' => 'relationship#follow', as: 'follow'
  post 'unfollow/:id' => 'relationship#follow', as: 'unfollow'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
