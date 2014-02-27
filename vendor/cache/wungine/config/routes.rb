Wungine::Engine.routes.draw do
  get "weather/index"
  post "weather/show"
  root 'weather#index'

end
