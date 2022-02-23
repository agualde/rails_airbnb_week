Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home', as: :home
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :flats do
    resources :bookings, only: %i[new create show]
  end
  resources :bookings, only: [:destroy]
  resources :dashboards, only: [:index]

  get '/accept_booking/:id_booking', to: 'bookings#accept_booking', as: :accept_booking

end
