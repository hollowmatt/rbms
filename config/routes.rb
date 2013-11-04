Rbms::Application.routes.draw do
  root :to => 'home#index'

  get '/movies/:id' => 'movies#show', as: :movies_show
  get '/movies/find' => 'movies#find'
end
