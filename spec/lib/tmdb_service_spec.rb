# tmdb_service_spec.rb

require 'spec_helper'

describe "TMDB Service" do

	context "Sunny Day Tests" do
		let (:id) { 107 }
		let (:title) { "Snatch" }
		let (:api_key) { "7b8bf2fd5c51507ef3e8b77146b67029"}
		let (:path) {'/on9JlbGEccLsYkjeEph2Whm1DIp.jpg'}

		describe "Find movie by name" do
			it "should return movies matching the value passed in" do
				movies = TmdbService.find_movie_by_name(title)
				expect(movies.length).to be > 0
				expect(movies[0].title).to eq(title)
				expect(movies[0].id).to eq(id)
			end
		end

		describe "Find movie by id" do
			it "should return only the proper movie" do
				movie = TmdbService.get_movie_by_id(id)
				expect(movie.title).to eq(title)
			end
		end

		describe "Get movie poster" do
			it "should return a movie poster" do
				poster_path = TmdbService.get_movie_poster_url_by_size(path, Settings.tmdb.poster.size.tile)
				puts poster_path
				expect(poster_path).not_to be_nil
			end
		end

	end

	context "Rainy Day Tests" do
	end

end