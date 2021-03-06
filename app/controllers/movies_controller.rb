class MoviesController <  ApplicationController

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
