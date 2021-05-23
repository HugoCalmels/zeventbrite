Rails.application.routes.draw do
  resources :attendances
  resources :events
  devise_for :users
  resources :landing, only: [:index, :show]
  root 'landing#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
