Rails.application.routes.draw do
  post '/', to: 'movies#search', as: 'search'
  root 'movies#index'
end
