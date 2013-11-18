class CarouselController < FragmentController

  def carousel_items
    carousel_name = params[:name]
    if carousel_name == "playing"
      @tiles = TileMaker.movie_tiles(TmdbService.get_playing_movies)
    elsif carousel_name == "coming"
      @tiles = TileMaker.movie_tiles(TmdbService.get_coming_movies)
    elsif  carousel_name == "popular"
      @tiles = TileMaker.movie_tiles(TmdbService.get_popular_movies)
    else
      @tiles = TileMaker.movie_tiles(TmdbService.get_popular_movies)
    end

    render :partial => 'common/carousel_items', locals: {tiles: @tiles, data_lazy_load: "", link: ""}
  end


end