Rails.application.routes.draw do
  resources :rooms, only: [:index, :show]
  root to: "rooms#index"

  mount ActionCable.server => '/websocket'
end
