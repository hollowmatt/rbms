# movie_spec.rb
require 'spec_helper'

describe Movie do
	
	context "Sunny Day" do
		before(:each) do
			@movie = Movie.new(:id => 107)
			@movie.title = "Snatch"
			# @movie.id = 107
			@movie.adult = false
			@movie.status = "Released"
		end

		describe "Movie" do
			it "is invalid without an id" do
				expect{ Movie.new }.to raise_error(ArgumentError)
			end
		end

		describe "get availablity" do
			it "Should be available" do
				expect(@movie.available?).to be true
			end
		end

		describe "check age appropriateness" do
			it "should not be adult" do
				expect(@movie.is_adult?).to be false
			end
		end
	end
end