module ActionCacheHelper

  def home_index_cache_path
    create_action_cache_key(request, {}) do
      "/"
    end
  end

  def home_index_expire_cache?
    expire_fragment_view_cache_for_key(home_index_cache_path, self) if refresh_now?
  end

  def create_action_cache_key(request, opts={})
    params = request.params
    options_hash_string = opts.hash.to_s

    extra_options_key =  "#{I18n::locale}/#{options_hash_string}"
    yield + extra_options_key
  end

  def expire_fragment_view_cache_for_key(ckey, controller=nil)
    controller ||= ActionController::Base.new
    controller.expire_fragment(ckey)
  end

  def refresh_now?
    params[:force_refresh] == "true"
  end

end