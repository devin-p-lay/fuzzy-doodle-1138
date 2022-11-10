Rails.application.routes.draw do
  resources :mechanics, only: :show
  post '/mechanics/:id/rides', to: 'ride_mechanics#create'
  resources :amusement_parks, only: :show
end
