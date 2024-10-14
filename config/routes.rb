Rails.application.routes.draw do
  devise_for :users

  root 'movies#index'

  resources :movies do
    resources :reviews
  end

  resources :genres
end
