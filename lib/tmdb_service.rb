module TmdbService
	extend UsesFaraday
	extend CommonServiceFactory

	@conn = build_conn(Settings.tmdb.host)
	@data_mapper = default_data_mapper
	@key = Settings.tmdb.api_key
	@headers = {'Accept' => 'application/json', 'Content-Type' => 'application/json', 'api_key' => Settings.tmdb.api_key }
	class << self
		def find_movie_by_name(movie)
			name = "TmdbService#FindMovieByName"
			path = "3/search/movie"
			params = {
				query: movie
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
			path = "/3/movie/#{id}/credits"
			params = {
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
			movies = Array.new
			name = "TmdbService#GetSimilarMovies"
			path = "/3/movie/#{id}/similar"
			params = {
			}
			@headers.merge('X-Service-Name' => name)
			begin
				raw_response = @conn.get(path, params, @headers)
			rescue
				#do something exceptional
			end
			movies = @data_mapper.list_of_movies(raw_response)		
		end

		# These three methods are ripe for refactor to a single method
		def get_popular_movies
			movies = Array.new
			name = "TmdbService#GetPopularMovies"
			path = "/3/movie/popular"
			params = {
			}
			@headers.merge('X-Service-Name' => name)
			begin
      	raw_response = @conn.get(path, params, @headers)
			rescue
				#do something exceptional
			end
			movies = @data_mapper.list_of_movies(raw_response)
		end

		def get_playing_movies
			movies = Array.new
			name = "TmdbService#GetPlayingMovies"
			path = "/3/movie/now_playing"
			params = {
			}
			@headers.merge('X-Service-Name' => name)
			begin
				raw_response = @conn.get(path, params, @headers)
			rescue
				#do something exceptional
			end
			movies = @data_mapper.list_of_movies(raw_response)
		end

		def get_coming_movies
			movies = Array.new
			name = "TmdbService#GetComingMovies"
			path = "/3/movie/upcoming"
			params = {
			}
			@headers.merge('X-Service-Name' => name)
			begin
				raw_response = @conn.get(path, params, @headers)
			rescue
				#do something exceptional
			end
			movies = @data_mapper.list_of_movies(raw_response)
		end
	end
end

