Rails.application.routes.draw do
  get '/followers', to: 'followers#index', as: 'show_follower'
  get '/search', to: 'home#search', as: 'search_user'
  root 'home#index'
end
