Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :forecast
    end
  end
end
