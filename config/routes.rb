Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: "pages#home"
  # verb "path", to: "controller#action"
  get "restaurants", to: "restaurants#index"
  get "restaurants/new", to: "restaurants#new", as: :new_restaurant
  post "restaurants", to: "restaurants#create"
  get "restaurants/:id", to: "restaurants#show", as: :restaurant
  get "restaurants/:id/edit", to: "restaurants#edit", as: :edit_restaurant
  patch "restaurants/:id", to: "restaurants#update"
  delete "restaurants/:id", to: "restaurants#destroy"

  resources :restaurants do
    resources :bookings, except: [:destroy]
    delete "bookings/:id", to: "bookings#destroy", as: :delete_booking
    resources :reviews, only: [:new, :create]
  end

  resources :bookings, only: %i[index]

  resources :reviews, only: %i[destroy]
end
