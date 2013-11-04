# home_controller.rb
class HomeController < ApplicationController

	def index
		@popular = TileMaker.movie_tiles(TmdbService.get_popular_movies)
		@playing = TileMaker.movie_tiles(TmdbService.get_playing_movies)
		@coming = TileMaker.movie_tiles(TmdbService.get_coming_movies)
		@hero = 'some hero image'
		render :index
	end

	def error(code)

	end
end