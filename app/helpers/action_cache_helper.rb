module ActionCacheHelper

  # common methods
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

  def fresh_action_cache?
    params[:force_refresh] == "true"
  end

end