Rbms::Application.routes.draw do
  root :to => 'home#index', as: :homepage

  get '/movies/find' => 'movies#find'
  get '/movies/:id' => 'movies#show', as: :movies_show
  get '/chart' => 'chart#index'
  get '/chart_data' => 'chart#get_data', as: :completed_tasks_charts

  mount Wungine::Engine, at: "weather", as: :wungine

end
