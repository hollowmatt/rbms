# home_controller.rb
class HomeController < ApplicationController

	def index
		@popular = 'popular movies from TMDB'
		@hero = 'some hero image'
		render :index
	end

	def error(code)

	end
end