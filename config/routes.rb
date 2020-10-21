Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  namespace :admin do
    resources :trains do
      resources :carriages, shallow: true
    end
    resources :railway_stations do
      patch :update_position, on: :member
    end
    resources :routes
    resources :carriages
    resources :tickets
  end
  resource :search, only: %i[new create show edit]
  resources :tickets do
    post :new, on: :member
  end

  root 'searches#show'
end
