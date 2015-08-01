Rails.application.routes.draw do
  resources :offers
  resources :listings
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
end
