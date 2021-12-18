Rails.application.routes.draw do
  root "login#show"

  get '/login', to: 'login#show'
  resource :session, only: [:create, :destroy]
end
