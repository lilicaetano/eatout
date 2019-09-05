Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'users/:id', to: 'users#show'
  # get 'restaurants/map', to: 'restaurants#map'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :restaurants, only: [:index, :show]
  resources :meetings, only: [:index, :show, :create, :new] # add create meeting functionality later?
end
