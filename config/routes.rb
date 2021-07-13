Rails.application.routes.draw do

  resources :racers
  root 'pages#home'
end
