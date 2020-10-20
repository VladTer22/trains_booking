Rails.application.routes.draw do
  resources :trains do
    resources :carriages, shallow: true
  end
  resources :railway_stations do
    patch :update_position, on: :member
  end
  resources :routes
  resources :carriages
  resource :search, only: %i[new create show edit]
  resources :tickets do
    post :new, on: :member
  end

  root 'trains#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
