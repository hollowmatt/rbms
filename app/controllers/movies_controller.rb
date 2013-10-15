class MoviesController <  ApplicationController

	def show
		id = 107 #params[:id]
		logger.info("in the show action")
		@movie = TmdbService.get_movie_by_id(id)
	end

	def find
		name = "Snatch" #params[:title]
		logger.info("in the show action")
		@movie = TmdbService.find_movie_by_name(name)
	end	
end