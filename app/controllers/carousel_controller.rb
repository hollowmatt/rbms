class CarouselController < FragmentController

  def carousel_items
    tiles = CarouselMaker.get_tiles_by_carousel_name(params[:name])
    render :partial => 'common/carousel_items', locals: {tiles: tiles, link: ""}
  end

  def movie_related_carousel_items
    tiles = CarouselMaker.get_movie_related_tiles(params[:name], params[:movie_id])
    render :partial => 'common/carousel_items', locals: {tiles: tiles, link: ""}
  end

end