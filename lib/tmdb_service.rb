module TmdbService
	extend UsesFaraday
	extend CommonServiceFactory

	@conn = build_conn(Settings.tmdb.host)
	@data_mapper = default_data_mapper
	@key = Settings.tmdb.api_key
	@headers = {'Accept' => 'application/json', 'Content-Type' => 'application/json'}
	class << self
		def find_movie_by_name(movie)
			name = "TmdbService#FindMovieByName"
			path = "3/search/movie"
			params = {
				query: movie,
				api_key: @key
			}
			@headers.merge('X-Service-Name' => name)
			begin
				raw_response = @conn.get(path, params, @headers)
			rescue
				#do something exceptional
			end
			@data_mapper.movie_results(raw_response)
		end

		def get_movie_by_id(id)
			name = "TmdbService#GetMovieById"
			path = "3/movie/#{id}"
			params = {
				api_key: @key
			}
			@headers.merge('X-Service-Name' => name)
			begin
				raw_response = @conn.get(path, params, @headers)
			rescue
				#do something exceptional
			end
			@data_mapper.movie_result(raw_response)
		end

		def get_movie_poster_url_by_size(path, size)
			poster_url = Settings.tmdb.base_url + "/#{size}#{path}"
		end

		def get_movie_cast(id)
			cast = Array.new
			name = "TmdbService#GetMovieCast"
			path = "/3/movie/#{id}/casts"
			params = {
				api_key: @key
			}
			@headers.merge('X-Service-Name' => name)
			begin 
				raw_response = @conn.get(path, params, @headers)
			rescue
				#do something exceptional
			end
			cast = @data_mapper.cast_list(raw_response)
		end

		def get_similar_movies(id)

		end

	end
end

