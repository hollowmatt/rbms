# home_controller.rb
class HomeController < ApplicationController
  include HomeHelper

  before_filter :home_index_expire_cache?, :only => [:index]

  caches_action :index,
    :cache_path => :home_index_cache_path.to_proc,
    :expires_in => 90.minutes,
    'max-stale' => 2.hours,
    :public => true

  def index
    @carousels = CarouselMaker.all_carousels_with_some_lazy_loading
    render :index
  end

  def error(code)

  end

end