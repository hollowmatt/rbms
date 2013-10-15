# movie_spec.rb
require 'spec_helper'

describe Movie do
	
	context "Sunny Day" do
		before(:each) do
			@movie = Movie.new
			@movie.title = "Snatch"
			@movie.id = 107
			@movie.adult = false
			@movie.status = "Released"
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