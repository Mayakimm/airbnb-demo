Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :users, only: %i[show]
  resources :flats, only: %i[show new create edit update destroy]

  resources :bookings, only: %i[show create destroy] do
    resources :reviews, only: %i[new create destroy]
  end


end
