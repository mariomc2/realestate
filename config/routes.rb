Rails.application.routes.draw do
  resources :managements
  resources :engagements
  resources :properties
  resources :buildings
  get 'pages/home'
  devise_for :users
	root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
