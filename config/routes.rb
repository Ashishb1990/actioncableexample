Rails.application.routes.draw do
  get 'events/index'

  root 'home#index'
  get '/data', to: "events#data_write"
   mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
