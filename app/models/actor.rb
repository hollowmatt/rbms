class Actor < Hashie::Dash
	#general properties
	property :id, required: true
	property :name
	property :profile_path
end