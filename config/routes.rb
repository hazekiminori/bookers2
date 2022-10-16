Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    delete 'signout', to: 'devise/sessions#destroy'
  end
  
  root to: 'homes#top'

  get "homes/about" => "homes#about", as: "about"

  resources :books, only: [:new, :index, :show, :create, :edit, :delete]

  resources :users, only: [:show, :index, :edit, :update, :delete]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
