Rails.application.routes.draw do
  root to: 'homes#top'

  get 'home/about' => 'homes#about',as: :about

  devise_for :users, controllers: {
  	sessions: 'users/sessions',
  	registrations: 'users/registrations'
  	}

  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
  	resource :comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update, :index]

  get "search" => "users#search"

  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
