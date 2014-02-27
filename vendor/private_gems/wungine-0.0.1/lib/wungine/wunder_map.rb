require 'wungine/weather'

module Wungine
  class WunderMap
    def self.map_raw_weather(raw_mash)
      w = Wungine::Weather.new
      w.city = raw_mash.current_observation.display_location.city
      w.country = raw_mash.current_observation.display_location.country
      w.temp_f = raw_mash.current_observation.temp_f
      w.temp_c = raw_mash.current_observation.temp_c
      w.feels_like_f = raw_mash.current_observation.feels_like_f
      w.feels_like_c = raw_mash.current_observation.feels_like_c
      w.weather = raw_mash.current_observation.weather
      w.icon = raw_mash.current_observation.icon_url
      w
    end
  end
end
