Rails.application.routes.draw do
  get '/search', to: 'home#search'
  root 'home#index'
end
