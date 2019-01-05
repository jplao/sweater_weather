Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :forecast, only: :show
      post '/users', to: 'users#create'
      post '/sessions', to: 'sessions#create'
      post '/favorites', to: 'favorites#create'
    end
  end
end
