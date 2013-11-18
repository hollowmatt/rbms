class MoviesController <  ApplicationController
  include MoviesHelper

  before_filter :movies_show_expire_cache?, :only => [:show]
  before_filter :movies_find_expire_cache?, :only => [:find]

  caches_action :show,
    :cache_path => :movies_show_cache_path.to_proc,
    :expires_in => 90.minutes,
    'max-stale' => 2.hours,
    :public => true

  caches_action :find,
    :cache_path => :movies_find_cache_path.to_proc,
    :expires_in => 90.minutes,
    'max-stale' => 2.hours,
    :public => true

	def show
		id = params[:id]
		logger.info("in the show action")
		@movie = TmdbService.get_movie_by_id(id)
		logger.info("poster: " + TmdbService.get_movie_poster_url_by_size(@movie.poster_path, Settings.tmdb.poster.size.pdp))
		@poster = TmdbService.get_movie_poster_url_by_size(@movie.poster_path, Settings.tmdb.poster.size.pdp)
		@cast_list = TileMaker.actor_tiles(TmdbService.get_movie_cast(id))
		@movie_list = TileMaker.movie_tiles(TmdbService.get_similar_movies(id))
	end

	def find
		name = params[:title]
		logger.info("in the find action")
		@movie_tiles = TileMaker.movie_tiles(TmdbService.find_movie_by_name(name))
	end
end
