module CarouselMaker

  class << self

    AVAILABLES = ["now-playing", "coming-soon", "popular-movies"]
    MOVIE_RELATED_CAROUSELS = ["cast-list", "movie-list"]

    def all_carousels(lazy_loading_some=false)
      carousels = Array.new
      AVAILABLES.each_with_index do |name, idx|
        feeling_lazy = idx > 0 && lazy_loading_some

        lazy_load_resource = "/carousel/#{name}" if feeling_lazy
        tiles = get_tiles_by_carousel_name(name) unless feeling_lazy

        props = {
          lazy_load_resource: lazy_load_resource,
          name: name,
          tiles: tiles
        }
        carousels << Carousel.new(props)
      end
      carousels
    end

    def all_carousels_with_some_lazy_loading
      all_carousels(true)
    end

    def movie_related_carousels(movie_id, lazy_loading_some=false)
      carousels = Array.new
      MOVIE_RELATED_CAROUSELS.each_with_index do |name, idx|
        feeling_lazy = idx > 0 && lazy_loading_some

        lazy_load_resource = "/carousel/#{name}/#{movie_id}" if feeling_lazy
        tiles = get_movie_related_tiles(name, movie_id) unless feeling_lazy

        props = {
          lazy_load_resource: lazy_load_resource,
          name: name,
          tiles: tiles
        }
        carousels << Carousel.new(props)
      end
      carousels
    end

    def movie_related_carousels_with_some_lazy_loading(movie_id)
      movie_related_carousels(movie_id, true)
    end

    def get_movie_related_tiles(name, movie_id)
      if name == "cast-list"
        @tiles = TileMaker.actor_tiles(TmdbService.get_movie_cast(movie_id))
      elsif name == "movie-list"
        @tiles = TileMaker.movie_tiles(TmdbService.get_similar_movies(movie_id))
      else
        @tiles = []
      end
    end

    def get_tiles_by_carousel_name(name)
      if name == "now-playing"
        @tiles = TileMaker.movie_tiles(TmdbService.get_playing_movies)
      elsif name == "coming-soon"
        @tiles = TileMaker.movie_tiles(TmdbService.get_coming_movies)
      elsif  name == "popular-movies"
        @tiles = TileMaker.movie_tiles(TmdbService.get_popular_movies)
      else
        @tiles = []
      end
    end

  end
end