Rails.application.routes.draw do
  resources :film_reviews
  resources :films
  get 'users/show'
  root 'films#index'
  get 'static_pages/home'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
