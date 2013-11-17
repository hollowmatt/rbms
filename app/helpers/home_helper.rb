module HomeHelper
  include ActionCacheHelper

  def home_index_cache_path
    create_action_cache_key(request, {}) do
      "/"
    end
  end

  def home_index_expire_cache?
    expire_fragment_view_cache_for_key(home_index_cache_path, self) if fresh_action_cache?
  end

end