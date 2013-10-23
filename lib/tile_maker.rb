module TileMaker

	class << self

		def actor_tiles(actors)
			tiles = Array.new
			actors.each do |actor|
				actor_props = {
					image_path: actor.profile_path,
					image_text: actor.name,
					image_id: actor.id
				}
				tiles << Tile.new(actor_props)
			end
			tiles
		end

		def movie_tiles(movies)
			tiles = Array.new
			movies.each do |movie|
				movie_props = {
					image_path: movie.poster_path,
					image_text: movie.title,
					image_id: movie.id
				}	
				tiles << Tile.new(movie_props)
			end
			tiles
		end

	end
end