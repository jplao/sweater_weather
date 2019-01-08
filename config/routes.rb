Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :forecast, only: :show
      post '/users', to: 'users#create'
      post '/sessions', to: 'sessions#create'
      get 'favorites', to: 'favorites#show'
      post 'favorites', to: 'favorites#create'
      delete 'favorites', to: 'favorites#delete'
    end
  end
end
