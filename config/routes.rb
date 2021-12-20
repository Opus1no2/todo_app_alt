Rails.application.routes.draw do
  root "login#show"

  get '/login', to: 'login#show'
  resource :session, only: [:create, :destroy]
  resources :todo_lists, only: [:index, :show] do
    resources :todos, only: [:index]
  end
end
