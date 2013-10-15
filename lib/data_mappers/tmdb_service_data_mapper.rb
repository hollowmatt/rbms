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
  end
end