class Movie < Hashie::Dash
	#general properties
	property :id, required: true
	property :title
	property :release_date
	property :tagline
	property :overview
	property :runtime
	property :poster_path
	property :adult
	property :status

	#Ratings
	property :vote_average
	property :vote_count

	def is_adult?
		adult
	end

	def available?
		status == 'Released' ? true : false
	end

end