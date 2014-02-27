Rbms::Application.routes.draw do
  root :to => 'home#index', as: :homepage

  get '/movies/find' => 'movies#find'
  get '/movies/:id' => 'movies#show', as: :movies_show

  mount Wungine::Engine, at: "weather", as: :wungine

end
