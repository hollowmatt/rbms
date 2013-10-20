class MoviesController <  ApplicationController

	def show
		id = 107 #params[:id]
		logger.info("in the show action")
		@movie = TmdbService.get_movie_by_id(id)
		logger.info("poster: " + TmdbService.get_movie_poster_url_by_size(@movie.poster_path, Settings.tmdb.poster.size.pdp))
		@poster = TmdbService.get_movie_poster_url_by_size(@movie.poster_path, Settings.tmdb.poster.size.pdp)
	end

	def find
		name = "Snatch" #params[:title]
		logger.info("in the show action")
		@movie = TmdbService.find_movie_by_name(name)
	end	
end
