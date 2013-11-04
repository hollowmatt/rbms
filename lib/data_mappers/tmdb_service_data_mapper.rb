module DataMappers
  class TmdbServiceDataMapper
  	def movie_results(raw_response)
  		body = raw_response.body
  		movies = Array.new
  		body.results.each do |result|
  			movie_props = {
  				title: result.try(:title),
  				release_date: result.try(:release_date),
  				id: result.try(:id),
  				adult: result.try(:adult),
  				poster_path: result.try(:poster_path)
  			}
  			movies << Movie.new(movie_props)
  		end
      movies
  	end

  	def movie_result(raw_response)
  		body = raw_response.body
  		movie_props = {
  			id: body.try(:id),
  			title: body.try(:title),
				release_date: body.try(:release_date),
				tagline: body.try(:tagline).html_safe,
				overview: body.try(:overview).html_safe,
				runtime: body.try(:runtime),
				poster_path: body.try(:poster_path),
				adult: body.try(:adult),
				status: body.try(:status)
			}
			Movie.new(movie_props)
		end

    def cast_list(raw_response)
      cast_list = Array.new
      cast = raw_response.body.cast
      cast.each do |actor|
        actor_props = {
          id: actor.try(:id),
          name: actor.try(:name),
          profile_path: actor.try(:profile_path)
        }
        cast_list << Actor.new(actor_props)
      end
      cast_list
    end

    def list_of_movies(raw_response)
      movie_list = Array.new
      movies = raw_response.body.results
      movies.each do |movie|
        movie_props = {
          id: movie.try(:id),
          title: movie.try(:title),
          poster_path: movie.try(:poster_path)
        }
        movie_list << Movie.new(movie_props)
      end
      movie_list
    end
  end
end