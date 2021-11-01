Rails.application.routes.draw do
  devise_for :users ,:controllers => {:registrations => "users/registrations"}

  devise_scope :user do
    root 'devise/sessions#new'
  end

  resources :service_types
  resources :parcels
  resources :addresses
  resources :users

  get '/search', to: 'search#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
