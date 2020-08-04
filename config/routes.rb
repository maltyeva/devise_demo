Rails.application.routes.draw do
  resources :restaurants
  resources :restaraurants
  resources :flats
  devise_for :users
  root to: 'pages#home'

  post '/login', to: "login#login"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
