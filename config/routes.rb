Rails.application.routes.draw do
  get '/followers', to: 'followers#index'
  get '/search', to: 'home#search'
  root 'home#index'
end
