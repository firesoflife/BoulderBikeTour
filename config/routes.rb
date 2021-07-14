Rails.application.routes.draw do
  root 'pages#home'

  namespace :api do
    namespace :v1 do
      resources :racers do
      end
    end
  end
  get '*path', to: 'pages#home', via: :all
end
