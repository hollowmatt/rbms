# home_controller.rb
class HomeController < ApplicationController
  include HomeHelper

  before_filter :home_index_expire_cache?, :only => [:index]

  caches_action :index,
    :cache_path => :home_index_cache_path.to_proc,
    :expires_in => 90.minutes,
    'max-stale' => 2.hours,
    :public => true

  def index
    @popular = TileMaker.movie_tiles(TmdbService.get_popular_movies)
    render :index
  end

  def error(code)

  end

end