Rbms::Application.routes.draw do
  root :to => 'home#index'

  get '/movies/find' => 'movies#find'
  get '/movies/:id' => 'movies#show', as: :movies_show

end
