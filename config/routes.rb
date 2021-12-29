# frozen_string_literal: true

Rails.application.routes.draw do
  root 'login#show'

  get '/login', to: 'login#show'
  resource :session, only: %i[create destroy]
  resources :todo_lists do
    resources :todos
  end
  resource :registration, only: %i[show create]
end
