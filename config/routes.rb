Rails.application.routes.draw do
  resources :offers do
    resources :comments
    member do
      put :accept
      put :reject
    end
  end
  resources :listings
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users, controllers: { :registrations => "user/registrations" }
end
