# frozen_string_literal: true

Rails.application.routes.draw do
  root 'login#show'

  get '/login', to: 'login#show'
  resource :session, only: %i[create destroy]
  resources :todo_lists, only: %i[index show] do
    resources :todos
  end
end
