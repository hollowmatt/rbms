Rbms::Application.routes.draw do
  root :to => 'home#index'

  get '/movies/find' => 'movies#find'
  get "/carousel/:name" => 'carousel#carousel_items'
  get "/carousel/:name/:movie_id" => 'carousel#movie_related_carousel_items'
  get '/movies/:id' => 'movies#show', as: :movies_show

end