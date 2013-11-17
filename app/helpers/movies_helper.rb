module MoviesHelper
  include ActionCacheHelper

  def movies_show_cache_path
    create_action_cache_key(request, {}) do
      "/movies/#{params[:id]}"
    end
  end

  def movies_show_expire_cache?
    expire_fragment_view_cache_for_key(movies_show_cache_path, self) if fresh_action_cache?
  end

  def movies_find_cache_path
    create_action_cache_key(request, {}) do
      "/movies/#{params[:id]}"
    end
  end

  def movies_find_expire_cache?
    expire_fragment_view_cache_for_key(movies_show_cache_path, self) if fresh_action_cache?
  end

end