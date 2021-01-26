Rails.application.routes.draw do
 
  namespace :api do
    resources :foodbags, only: [:create]
  end
end
